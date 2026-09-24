import 'package:ascent/features/programs/domain/entities/set_log.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'workout_logging_event.freezed.dart';

@freezed
sealed class WorkoutLoggingEvent with _$WorkoutLoggingEvent {
  const factory WorkoutLoggingEvent.started({required String sessionId}) =
      WorkoutLoggingStarted;
  const factory WorkoutLoggingEvent.setLogged({required SetLog setLog}) =
      WorkoutSetLogged;
  const factory WorkoutLoggingEvent.sessionCompleted({
    required String sessionId,
    required int sessionRpe,
    required int durationMinutes,
  }) = WorkoutSessionCompleted;
}
