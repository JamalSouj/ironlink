// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SetLogModel _$SetLogModelFromJson(Map<String, dynamic> json) => _SetLogModel(
  id: json['id'] as String,
  workoutSessionId: json['workout_session_id'] as String,
  exerciseId: json['exercise_id'] as String,
  setOrder: (json['set_order'] as num).toInt(),
  prescribedReps: (json['prescribed_reps'] as num?)?.toInt(),
  prescribedLoadKg: (json['prescribed_load_kg'] as num?)?.toDouble(),
  prescribedPct1Rm: (json['prescribed_pct1_rm'] as num?)?.toDouble(),
  actualReps: (json['actual_reps'] as num?)?.toInt(),
  actualLoadKg: (json['actual_load_kg'] as num?)?.toDouble(),
  actualRpe: (json['actual_rpe'] as num?)?.toDouble(),
  tempo: json['tempo'] as String?,
  completedAt: json['completed_at'] == null
      ? null
      : DateTime.parse(json['completed_at'] as String),
);

Map<String, dynamic> _$SetLogModelToJson(_SetLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workout_session_id': instance.workoutSessionId,
      'exercise_id': instance.exerciseId,
      'set_order': instance.setOrder,
      'prescribed_reps': instance.prescribedReps,
      'prescribed_load_kg': instance.prescribedLoadKg,
      'prescribed_pct1_rm': instance.prescribedPct1Rm,
      'actual_reps': instance.actualReps,
      'actual_load_kg': instance.actualLoadKg,
      'actual_rpe': instance.actualRpe,
      'tempo': instance.tempo,
      'completed_at': instance.completedAt?.toIso8601String(),
    };
