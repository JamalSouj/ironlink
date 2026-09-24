// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'readiness_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReadinessLogModel _$ReadinessLogModelFromJson(Map<String, dynamic> json) =>
    _ReadinessLogModel(
      id: json['id'] as String,
      clientId: json['client_id'] as String,
      logDate: DateTime.parse(json['log_date'] as String),
      sleepQuality: (json['sleep_quality'] as num).toInt(),
      soreness: (json['soreness'] as num).toInt(),
      stress: (json['stress'] as num).toInt(),
      readinessScore: (json['readiness_score'] as num).toDouble(),
    );

Map<String, dynamic> _$ReadinessLogModelToJson(_ReadinessLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'client_id': instance.clientId,
      'log_date': instance.logDate.toIso8601String(),
      'sleep_quality': instance.sleepQuality,
      'soreness': instance.soreness,
      'stress': instance.stress,
      'readiness_score': instance.readinessScore,
    };
