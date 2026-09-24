final class Exercise {
  const Exercise({
    required this.id,
    required this.name,
    required this.category,
    this.demoVideoUrl,
    this.createdBy,
    this.createdAt,
  });

  final String id;
  final String name;
  final String category;
  final String? demoVideoUrl;
  final String? createdBy;
  final DateTime? createdAt;
}
