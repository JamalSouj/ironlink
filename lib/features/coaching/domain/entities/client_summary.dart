import 'package:ascent/features/auth/domain/entities/auth_user.dart';

class ClientSummary {
  const ClientSummary({
    required this.user,
    this.activeProgramName,
    this.latestReadinessScore,
  });

  final AuthUser user;
  final String? activeProgramName;
  final double? latestReadinessScore;
}
