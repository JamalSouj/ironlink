import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';

part 'subscription_model.freezed.dart';
part 'subscription_model.g.dart';

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const SubscriptionModel._();

  const factory SubscriptionModel({
    required String id,
    required String coachId,
    required String plan,
    required String status,
    DateTime? currentPeriodEnd,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  Subscription toDomain() => Subscription(
    id: id,
    coachId: coachId,
    plan: plan,
    status: status,
    currentPeriodEnd: currentPeriodEnd,
  );

  static SubscriptionModel fromDomain(Subscription entity) => SubscriptionModel(
    id: entity.id,
    coachId: entity.coachId,
    plan: entity.plan,
    status: entity.status,
    currentPeriodEnd: entity.currentPeriodEnd,
  );
}
