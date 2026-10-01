import 'package:ironlink/features/auth/data/models/auth_user_model.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';

class ClientSummaryModel {
  const ClientSummaryModel._();

  static ClientSummary fromJson(Map<String, dynamic> json) {
    // The root JSON is the `profiles` row.
    // 'email' is in auth.users, not profiles, so we inject a default to satisfy AuthUserModel.
    final map = Map<String, dynamic>.from(json);
    map['email'] = map['email'] ?? '';
    
    final userModel = AuthUserModel.fromJson(map);

    // We expect programs and readiness_logs to be joined. They might be lists or null.
    String? activeProgramName;
    final programs = json['programs'] as List?;
    if (programs != null && programs.isNotEmpty) {
      activeProgramName = programs.first['name'] as String?;
    }

    double? latestReadinessScore;
    final readinessLogs = json['readiness_logs'] as List?;
    if (readinessLogs != null && readinessLogs.isNotEmpty) {
      final score = readinessLogs.first['readiness_score'];
      if (score != null) {
        latestReadinessScore = (score as num).toDouble();
      }
    }

    return ClientSummary(
      user: userModel.toDomain(),
      activeProgramName: activeProgramName,
      latestReadinessScore: latestReadinessScore,
    );
  }
}
