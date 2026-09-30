import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';

part 'workout_session_model.freezed.dart';
part 'workout_session_model.g.dart';

@freezed
abstract class WorkoutSessionModel with _$WorkoutSessionModel {
  const WorkoutSessionModel._();

  const factory WorkoutSessionModel({
    required String id,
    String? programBlockId,
    required String clientId,
    required DateTime scheduledDate,
    required String status,
    int? sessionRpe,
    int? durationMinutes,
  }) = _WorkoutSessionModel;

  factory WorkoutSessionModel.fromJson(Map<String, dynamic> json) =>
      _$WorkoutSessionModelFromJson(json);

  WorkoutSession toDomain() => WorkoutSession(
    id: id,
    programBlockId: programBlockId,
    clientId: clientId,
    scheduledDate: scheduledDate,
    status: status,
    sessionRpe: sessionRpe,
    durationMinutes: durationMinutes,
  );

  static WorkoutSessionModel fromDomain(WorkoutSession entity) =>
      WorkoutSessionModel(
        id: entity.id,
        programBlockId: entity.programBlockId,
        clientId: entity.clientId,
        scheduledDate: entity.scheduledDate,
        status: entity.status,
        sessionRpe: entity.sessionRpe,
        durationMinutes: entity.durationMinutes,
      );
}
