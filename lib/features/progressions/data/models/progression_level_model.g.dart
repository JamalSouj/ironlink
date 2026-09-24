// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progression_level_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressionLevelModel _$ProgressionLevelModelFromJson(
  Map<String, dynamic> json,
) => _ProgressionLevelModel(
  id: json['id'] as String,
  progressionId: json['progression_id'] as String,
  exerciseId: json['exercise_id'] as String,
  levelOrder: (json['level_order'] as num).toInt(),
  unlockCriteria: json['unlock_criteria'] as Map<String, dynamic>,
);

Map<String, dynamic> _$ProgressionLevelModelToJson(
  _ProgressionLevelModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'progression_id': instance.progressionId,
  'exercise_id': instance.exerciseId,
  'level_order': instance.levelOrder,
  'unlock_criteria': instance.unlockCriteria,
};
