import 'package:ascent/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'readiness_state.freezed.dart';

@freezed
sealed class ReadinessState with _$ReadinessState {
  const factory ReadinessState.initial() = ReadinessInitial;
  const factory ReadinessState.loading() = ReadinessLoading;
  const factory ReadinessState.needsSubmission() = ReadinessNeedsSubmission;
  const factory ReadinessState.completed() = ReadinessCompleted;
  const factory ReadinessState.error({required Failure failure}) =
      ReadinessError;
}
