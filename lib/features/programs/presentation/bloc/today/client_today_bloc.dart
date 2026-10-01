import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/programs/domain/usecases/watch_today_session.dart';
import 'package:ironlink/features/programs/presentation/bloc/today/client_today_event.dart';
import 'package:ironlink/features/programs/presentation/bloc/today/client_today_state.dart';

@injectable
class ClientTodayBloc extends Bloc<ClientTodayEvent, ClientTodayState> {
  ClientTodayBloc(this._watchTodaySession)
    : super(const ClientTodayState.initial()) {
    on<ClientTodayEvent>((event, emit) async {
      await switch (event) {
        ClientTodayStarted(:final clientId) => _onStarted(clientId, emit),
      };
    });
  }

  final WatchTodaySession _watchTodaySession;

  Future<void> _onStarted(
    String clientId,
    Emitter<ClientTodayState> emit,
  ) async {
    emit(const ClientTodayState.loading());
    await emit.forEach(
      _watchTodaySession(clientId),
      onData: (either) => either.fold(
        (f) => ClientTodayState.error(failure: f),
        (session) => ClientTodayState.loaded(session: session),
      ),
      onError: (dynamic error, _) => const ClientTodayState.error(
        failure: ServerFailure(message: 'Failed to stream today session'),
      ),
    );
  }
}
