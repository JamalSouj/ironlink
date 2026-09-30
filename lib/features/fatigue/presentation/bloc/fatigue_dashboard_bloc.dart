import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/fatigue/domain/usecases/watch_client_fatigue_data.dart';
import 'package:ironlink/features/fatigue/presentation/bloc/fatigue_dashboard_event.dart';
import 'package:ironlink/features/fatigue/presentation/bloc/fatigue_dashboard_state.dart';

// The risk threshold standard is typically > 1.5 for the acute:chronic workload ratio.
const _kAcwrRiskThreshold = 1.5;

@injectable
class FatigueDashboardBloc
    extends Bloc<FatigueDashboardEvent, FatigueDashboardState> {
  FatigueDashboardBloc(this._watchClientFatigueData)
    : super(const FatigueDashboardState.initial()) {
    on<FatigueDashboardEvent>((event, emit) async {
      await switch (event) {
        FatigueDashboardStarted(:final clientId) => _onStarted(clientId, emit),
      };
    });
  }

  final WatchClientFatigueData _watchClientFatigueData;

  Future<void> _onStarted(
    String clientId,
    Emitter<FatigueDashboardState> emit,
  ) async {
    emit(const FatigueDashboardState.loading());

    await emit.forEach(
      _watchClientFatigueData(clientId),
      onData: (either) => either.fold(
        (f) => FatigueDashboardState.error(failure: f),
        (points) {
          final isAtRisk =
              points.isNotEmpty && points.last.acwr > _kAcwrRiskThreshold;
          return FatigueDashboardState.loaded(data: points, isAtRisk: isAtRisk);
        },
      ),
      onError: (dynamic error, _) => const FatigueDashboardState.error(
        failure: ServerFailure(message: 'Failed to stream fatigue data'),
      ),
    );
  }
}
