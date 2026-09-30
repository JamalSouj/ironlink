import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/progressions/domain/entities/progression.dart';
import 'package:ironlink/features/progressions/domain/usecases/watch_coach_progressions.dart';
import 'package:ironlink/features/progressions/presentation/bloc/list/progressions_list_event.dart';
import 'package:ironlink/features/progressions/presentation/bloc/list/progressions_list_state.dart';

@injectable
class ProgressionsListBloc
    extends Bloc<ProgressionsListEvent, ProgressionsListState> {
  ProgressionsListBloc(this._watchCoachProgressions, this._authBloc)
    : super(const ProgressionsListState.initial()) {
    on<ProgressionsListStarted>(_onStarted);
  }

  final WatchCoachProgressions _watchCoachProgressions;
  final AuthBloc _authBloc;

  Future<void> _onStarted(
    ProgressionsListStarted event,
    Emitter<ProgressionsListState> emit,
  ) async {
    emit(const ProgressionsListState.loading());
    final authState = _authBloc.state;
    String? coachId;
    if (authState is AuthenticatedCoach) {
      coachId = authState.user.id;
    }
    if (coachId == null) {
      emit(
        const ProgressionsListState.error(
          ServerFailure(message: 'Not logged in as a coach'),
        ),
      );
      return;
    }

    await emit.forEach<Either<Failure, List<Progression>>>(
      _watchCoachProgressions(coachId),
      onData: (either) => either.fold(
        (failure) => ProgressionsListState.error(failure),
        (progressions) => ProgressionsListState.loaded(progressions),
      ),
      onError: (error, _) =>
          ProgressionsListState.error(ServerFailure(message: error.toString())),
    );
  }
}
