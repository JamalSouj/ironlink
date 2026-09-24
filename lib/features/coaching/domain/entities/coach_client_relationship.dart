final class CoachClientRelationship {
  const CoachClientRelationship({
    required this.id,
    required this.coachId,
    required this.clientId,
    required this.status,
    required this.createdAt,
  });

  final String id;
  final String coachId;
  final String clientId;
  final String status;
  final DateTime createdAt;
}
