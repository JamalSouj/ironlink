import 'package:ironlink/features/programs/domain/usecases/complete_session.dart';
import 'package:ironlink/features/programs/domain/usecases/log_set.dart';
import 'package:ironlink/features/programs/presentation/bloc/workout/workout_logging_event.dart';
import 'package:ironlink/features/programs/presentation/bloc/workout/workout_logging_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'package:ironlink/features/progressions/domain/usecases/evaluate_progression_unlock.dart';

@injectable
class WorkoutLoggingBloc extends Bloc<WorkoutLoggingEvent, WorkoutLoggingState> {
  WorkoutLoggingBloc(
    this._logSet,
    this._completeSession,
    this._evaluateProgressionUnlock,
  ) : super(const WorkoutLoggingState.initial()) {
    on<WorkoutLoggingEvent>((event, emit) async {
      switch (event) {
        case WorkoutLoggingStarted():
          emit(const WorkoutLoggingState.active());
        case WorkoutSetLogged():
          await _onSetLogged(event, emit);
        case WorkoutSessionCompleted():
          await _onSessionCompleted(event, emit);
      }
    });
  }

  final LogSet _logSet;
  final CompleteSession _completeSession;
  final EvaluateProgressionUnlock _evaluateProgressionUnlock;

  Future<void> _onSetLogged(
    WorkoutSetLogged e,
    Emitter<WorkoutLoggingState> emit,
  ) async {
    await _logSet(e.setLog);
  }

  Future<void> _onSessionCompleted(
    WorkoutSessionCompleted e,
    Emitter<WorkoutLoggingState> emit,
  ) async {
    emit(const WorkoutLoggingState.submitting());
    
    final result = await _completeSession(
      CompleteSessionParams(
        sessionId: e.sessionId,
        sessionRpe: e.sessionRpe,
        durationMinutes: e.durationMinutes,
      ),
    );

    result.fold(
      (f) => emit(WorkoutLoggingState.error(failure: f)),
      (_) {
        // We will call the progression logic here later
        emit(const WorkoutLoggingState.completed(unlockedLevels: []));
      },
    );
  }
}
