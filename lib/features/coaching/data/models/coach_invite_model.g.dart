// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coach_invite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CoachInviteModel _$CoachInviteModelFromJson(Map<String, dynamic> json) =>
    _CoachInviteModel(
      id: json['id'] as String,
      coachId: json['coach_id'] as String,
      inviteCode: json['invite_code'] as String,
      status: json['status'] as String,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$CoachInviteModelToJson(_CoachInviteModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'invite_code': instance.inviteCode,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
    };
