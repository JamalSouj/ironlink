import 'package:freezed_annotation/freezed_annotation.dart';

part 'fatigue_dashboard_event.freezed.dart';

@freezed
sealed class FatigueDashboardEvent with _$FatigueDashboardEvent {
  const factory FatigueDashboardEvent.started({required String clientId}) =
      FatigueDashboardStarted;
}
