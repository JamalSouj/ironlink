import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/fatigue/domain/entities/training_load_point.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'fatigue_dashboard_state.freezed.dart';

@freezed
sealed class FatigueDashboardState with _$FatigueDashboardState {
  const factory FatigueDashboardState.initial() = FatigueDashboardInitial;
  const factory FatigueDashboardState.loading() = FatigueDashboardLoading;
  const factory FatigueDashboardState.loaded({
    required List<TrainingLoadPoint> data,
    required bool isAtRisk,
  }) = FatigueDashboardLoaded;
  const factory FatigueDashboardState.error({required Failure failure}) =
      FatigueDashboardError;
}
