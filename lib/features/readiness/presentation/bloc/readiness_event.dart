import 'package:freezed_annotation/freezed_annotation.dart';

part 'readiness_event.freezed.dart';

@freezed
sealed class ReadinessEvent with _$ReadinessEvent {
  const factory ReadinessEvent.started({required String clientId}) =
      ReadinessStarted;
  const factory ReadinessEvent.submitted({
    required String clientId,
    required int sleepQuality,
    required int soreness,
    required int stress,
  }) = ReadinessSubmitted;
}
