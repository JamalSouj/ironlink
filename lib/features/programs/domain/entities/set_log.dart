final class SetLog {
  const SetLog({
    required this.id,
    required this.workoutSessionId,
    required this.exerciseId,
    required this.setOrder,
    this.prescribedReps,
    this.prescribedLoadKg,
    this.prescribedPct1Rm,
    this.actualReps,
    this.actualLoadKg,
    this.actualRpe,
    this.tempo,
    this.completedAt,
  });

  final String id;
  final String workoutSessionId;
  final String exerciseId;
  final int setOrder;
  final int? prescribedReps;
  final double? prescribedLoadKg;
  final double? prescribedPct1Rm;
  final int? actualReps;
  final double? actualLoadKg;
  final double? actualRpe;
  final String? tempo;
  final DateTime? completedAt;
}
