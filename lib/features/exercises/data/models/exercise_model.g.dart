// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExerciseModel _$ExerciseModelFromJson(Map<String, dynamic> json) =>
    _ExerciseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String,
      demoVideoUrl: json['demo_video_url'] as String?,
      createdBy: json['created_by'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ExerciseModelToJson(_ExerciseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'category': instance.category,
      'demo_video_url': instance.demoVideoUrl,
      'created_by': instance.createdBy,
      'created_at': instance.createdAt?.toIso8601String(),
    };
