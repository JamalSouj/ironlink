final class Progression {
  const Progression({
    required this.id,
    required this.name,
    this.createdBy,
    this.createdAt,
  });

  final String id;
  final String name;
  final String? createdBy;
  final DateTime? createdAt;
}
