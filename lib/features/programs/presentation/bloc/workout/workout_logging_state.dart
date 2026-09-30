import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';

part 'workout_logging_state.freezed.dart';

@freezed
sealed class WorkoutLoggingState with _$WorkoutLoggingState {
  const factory WorkoutLoggingState.initial() = WorkoutLoggingInitial;
  const factory WorkoutLoggingState.active() = WorkoutLoggingActive;
  const factory WorkoutLoggingState.submitting() = WorkoutLoggingSubmitting;
  const factory WorkoutLoggingState.completed({
    // We can pass unlocked levels here later
    @Default([]) List<ProgressionLevel> unlockedLevels,
  }) = WorkoutLoggingCompleted;
  const factory WorkoutLoggingState.error({required Failure failure}) =
      WorkoutLoggingError;
}
