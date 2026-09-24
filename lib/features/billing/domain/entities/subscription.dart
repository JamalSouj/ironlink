class Subscription {
  final String id;
  final String coachId;
  final String plan;
  final String status;
  final DateTime? currentPeriodEnd;

  const Subscription({
    required this.id,
    required this.coachId,
    required this.plan,
    required this.status,
    this.currentPeriodEnd,
  });

  bool get isActive => status == 'active' || status == 'trialing';
  bool get isPro => plan == 'pro' && isActive;
}
