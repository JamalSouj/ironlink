// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      id: json['id'] as String,
      coachId: json['coach_id'] as String,
      plan: json['plan'] as String,
      status: json['status'] as String,
      currentPeriodEnd: json['current_period_end'] == null
          ? null
          : DateTime.parse(json['current_period_end'] as String),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'coach_id': instance.coachId,
      'plan': instance.plan,
      'status': instance.status,
      'current_period_end': instance.currentPeriodEnd?.toIso8601String(),
    };
