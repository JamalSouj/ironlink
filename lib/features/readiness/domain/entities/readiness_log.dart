class ReadinessLog {
  final String id;
  final String clientId;
  final DateTime logDate;
  final int sleepQuality;
  final int soreness;
  final int stress;
  final double readinessScore;

  const ReadinessLog({
    required this.id,
    required this.clientId,
    required this.logDate,
    required this.sleepQuality,
    required this.soreness,
    required this.stress,
    required this.readinessScore,
  });
}
