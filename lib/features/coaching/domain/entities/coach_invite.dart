class CoachInvite {
  final String id;
  final String coachId;
  final String inviteCode;
  final String status;
  final DateTime? createdAt;

  const CoachInvite({
    required this.id,
    required this.coachId,
    required this.inviteCode,
    required this.status,
    this.createdAt,
  });
}
