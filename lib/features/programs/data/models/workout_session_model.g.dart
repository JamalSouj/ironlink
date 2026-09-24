// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkoutSessionModel _$WorkoutSessionModelFromJson(Map<String, dynamic> json) =>
    _WorkoutSessionModel(
      id: json['id'] as String,
      programBlockId: json['program_block_id'] as String?,
      clientId: json['client_id'] as String,
      scheduledDate: DateTime.parse(json['scheduled_date'] as String),
      status: json['status'] as String,
      sessionRpe: (json['session_rpe'] as num?)?.toInt(),
      durationMinutes: (json['duration_minutes'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WorkoutSessionModelToJson(
  _WorkoutSessionModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'program_block_id': instance.programBlockId,
  'client_id': instance.clientId,
  'scheduled_date': instance.scheduledDate.toIso8601String(),
  'status': instance.status,
  'session_rpe': instance.sessionRpe,
  'duration_minutes': instance.durationMinutes,
};
