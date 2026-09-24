class TrainingLoadPoint {
  final DateTime date;
  final int? sessionRpe;
  final int? durationMinutes;
  final double dailyLoad;
  final double acuteLoad; // 7 day rolling
  final double chronicLoad; // 28 day rolling
  final double acwr;
  final int? sleepQuality;
  final int? soreness;
  final int? stress;

  const TrainingLoadPoint({
    required this.date,
    this.sessionRpe,
    this.durationMinutes,
    required this.dailyLoad,
    required this.acuteLoad,
    required this.chronicLoad,
    required this.acwr,
    this.sleepQuality,
    this.soreness,
    this.stress,
  });
}
