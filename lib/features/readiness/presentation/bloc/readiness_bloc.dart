import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/readiness/domain/entities/readiness_log.dart';
import 'package:ironlink/features/readiness/domain/usecases/check_today_readiness.dart';
import 'package:ironlink/features/readiness/domain/usecases/submit_readiness.dart';
import 'package:ironlink/features/readiness/presentation/bloc/readiness_event.dart';
import 'package:ironlink/features/readiness/presentation/bloc/readiness_state.dart';

@injectable
class ReadinessBloc extends Bloc<ReadinessEvent, ReadinessState> {
  ReadinessBloc(
    this._checkTodayReadiness,
    this._submitReadiness,
  ) : super(const ReadinessState.initial()) {
    on<ReadinessEvent>((event, emit) async {
      await switch (event) {
        ReadinessStarted(:final clientId) => _onStarted(clientId, emit),
        ReadinessSubmitted() => _onSubmitted(event, emit),
      };
    });
  }

  final CheckTodayReadiness _checkTodayReadiness;
  final SubmitReadiness _submitReadiness;

  Future<void> _onStarted(
    String clientId,
    Emitter<ReadinessState> emit,
  ) async {
    emit(const ReadinessState.loading());
    final result = await _checkTodayReadiness(clientId);
    
    result.fold(
      (f) => emit(ReadinessState.error(failure: f)),
      (log) {
        if (log == null) {
          emit(const ReadinessState.needsSubmission());
        } else {
          emit(const ReadinessState.completed());
        }
      },
    );
  }

  Future<void> _onSubmitted(
    ReadinessSubmitted e,
    Emitter<ReadinessState> emit,
  ) async {
    emit(const ReadinessState.loading());
    
    // Simple readiness score calculation (out of 10)
    // 5 = great, 1 = terrible for each. 15 points total.
    // Score = (sleep + soreness + stress) / 15 * 10
    final rawScore = e.sleepQuality + e.soreness + e.stress;
    final readinessScore = (rawScore / 15.0) * 10.0;

    final log = ReadinessLog(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      clientId: e.clientId,
      logDate: DateTime.now(),
      sleepQuality: e.sleepQuality,
      soreness: e.soreness,
      stress: e.stress,
      readinessScore: readinessScore,
    );

    final result = await _submitReadiness(log);
    
    result.fold(
      (f) => emit(ReadinessState.error(failure: f)),
      (_) => emit(const ReadinessState.completed()),
    );
  }
}
