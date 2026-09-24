final class ClientProgressionStatus {
  const ClientProgressionStatus({
    required this.id,
    required this.clientId,
    required this.progressionId,
    this.currentLevelId,
    this.unlockedAt,
  });

  final String id;
  final String clientId;
  final String progressionId;
  final String? currentLevelId;
  final DateTime? unlockedAt;
}
