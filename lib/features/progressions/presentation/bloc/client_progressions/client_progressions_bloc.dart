import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/client_progression_status.dart';
import 'package:ironlink/features/progressions/domain/usecases/watch_client_progressions.dart';
import 'package:ironlink/features/progressions/presentation/bloc/client_progressions/client_progressions_event.dart';
import 'package:ironlink/features/progressions/presentation/bloc/client_progressions/client_progressions_state.dart';

@injectable
class ClientProgressionsBloc
    extends Bloc<ClientProgressionsEvent, ClientProgressionsState> {
  ClientProgressionsBloc(this._watchClientProgressions)
    : super(const ClientProgressionsState.initial()) {
    on<ClientProgressionsEvent>((event, emit) async {
      switch (event) {
        case ClientProgressionsStarted(:final clientId):
          await _onStarted(clientId, emit);
      }
    });
  }

  final WatchClientProgressions _watchClientProgressions;

  Future<void> _onStarted(
    String clientId,
    Emitter<ClientProgressionsState> emit,
  ) async {
    emit(const ClientProgressionsState.loading());
    await emit.forEach<Either<Failure, List<ClientProgressionStatus>>>(
      _watchClientProgressions(clientId),
      onData: (either) => either.fold(
        (failure) => ClientProgressionsState.error(failure),
        (progressions) => ClientProgressionsState.loaded(progressions),
      ),
      onError: (error, _) =>
          ClientProgressionsState.error(ServerFailure(message: error.toString())),
    );
  }
}
