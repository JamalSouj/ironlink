// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'program_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProgramModel _$ProgramModelFromJson(Map<String, dynamic> json) =>
    _ProgramModel(
      id: json['id'] as String,
      coachId: json['coach_id'] as String,
      clientId: json['client_id'] as String,
      name: json['name'] as String,
      startDate: DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$ProgramModelToJson(_ProgramModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'client_id': instance.clientId,
      'name': instance.name,
      'start_date': instance.startDate.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'created_at': instance.createdAt.toIso8601String(),
    };
