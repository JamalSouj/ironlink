// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_progression_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ClientProgressionStatusModel _$ClientProgressionStatusModelFromJson(
  Map<String, dynamic> json,
) => _ClientProgressionStatusModel(
  id: json['id'] as String,
  clientId: json['client_id'] as String,
  progressionId: json['progression_id'] as String,
  currentLevelId: json['current_level_id'] as String?,
  unlockedAt: json['unlocked_at'] == null
      ? null
      : DateTime.parse(json['unlocked_at'] as String),
);

Map<String, dynamic> _$ClientProgressionStatusModelToJson(
  _ClientProgressionStatusModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'client_id': instance.clientId,
  'progression_id': instance.progressionId,
  'current_level_id': instance.currentLevelId,
  'unlocked_at': instance.unlockedAt?.toIso8601String(),
};
