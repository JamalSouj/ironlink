final class Program {
  const Program({
    required this.id,
    required this.coachId,
    required this.clientId,
    required this.name,
    required this.startDate,
    this.endDate,
    required this.createdAt,
  });

  final String id;
  final String coachId;
  final String clientId;
  final String name;
  final DateTime startDate;
  final DateTime? endDate;
  final DateTime createdAt;
}
