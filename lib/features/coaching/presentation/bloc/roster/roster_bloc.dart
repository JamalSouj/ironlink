import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:ironlink/features/coaching/domain/usecases/watch_my_clients.dart';
import 'package:ironlink/features/coaching/presentation/bloc/roster/roster_event.dart';
import 'package:ironlink/features/coaching/presentation/bloc/roster/roster_state.dart';

@injectable
class RosterBloc extends Bloc<RosterEvent, RosterState> {
  RosterBloc(this._watchMyClients, this._authBloc)
    : super(const RosterState.initial()) {
    on<RosterStarted>(_onStarted);
  }

  final WatchMyClients _watchMyClients;
  final AuthBloc _authBloc;

  Future<void> _onStarted(
    RosterStarted event,
    Emitter<RosterState> emit,
  ) async {
    emit(const RosterState.loading());
    final authState = _authBloc.state;
    final coachId = switch (authState) {
      AuthenticatedCoach(:final user) => user.id,
      _ => null,
    };
    if (coachId == null) {
      emit(
        const RosterState.error(
          ServerFailure(message: 'Not logged in as a coach'),
        ),
      );
      return;
    }

    await emit.forEach<Either<Failure, List<ClientSummary>>>(
      _watchMyClients(coachId),
      onData: (either) => either.fold(
        (failure) => RosterState.error(failure),
        (clients) => RosterState.loaded(clients),
      ),
      onError: (error, _) =>
          RosterState.error(ServerFailure(message: error.toString())),
    );
  }
}
