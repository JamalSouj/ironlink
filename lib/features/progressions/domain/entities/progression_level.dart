final class ProgressionLevel {
  const ProgressionLevel({
    required this.id,
    required this.progressionId,
    required this.exerciseId,
    required this.levelOrder,
    required this.unlockCriteria,
  });

  final String id;
  final String progressionId;
  final String exerciseId;
  final int levelOrder;
  final Map<String, dynamic> unlockCriteria;
}
