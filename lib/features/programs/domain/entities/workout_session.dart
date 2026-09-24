import 'package:ironlink/features/programs/domain/entities/set_log.dart';

final class WorkoutSession {
  const WorkoutSession({
    required this.id,
    this.programBlockId,
    required this.clientId,
    required this.scheduledDate,
    required this.status,
    this.sessionRpe,
    this.durationMinutes,
    this.setLogs = const [],
  });

  final String id;
  final String? programBlockId;
  final String clientId;
  final DateTime scheduledDate;
  final String status;
  final int? sessionRpe;
  final int? durationMinutes;
  final List<SetLog> setLogs;
}
