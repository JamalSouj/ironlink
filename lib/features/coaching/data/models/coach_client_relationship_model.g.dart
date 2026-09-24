// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_client_relationship_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachClientRelationshipModel _$CoachClientRelationshipModelFromJson(
  Map<String, dynamic> json,
) => _CoachClientRelationshipModel(
  id: json['id'] as String,
  coachId: json['coach_id'] as String,
  clientId: json['client_id'] as String,
  status: json['status'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
);

Map<String, dynamic> _$CoachClientRelationshipModelToJson(
  _CoachClientRelationshipModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'coach_id': instance.coachId,
  'client_id': instance.clientId,
  'status': instance.status,
  'created_at': instance.createdAt.toIso8601String(),
};
