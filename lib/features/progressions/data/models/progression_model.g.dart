// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progression_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgressionModel _$ProgressionModelFromJson(Map<String, dynamic> json) =>
    _ProgressionModel(
      id: json['id'] as String,
      name: json['name'] as String,
      createdBy: json['created_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProgressionModelToJson(_ProgressionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt?.toIso8601String(),
    };
