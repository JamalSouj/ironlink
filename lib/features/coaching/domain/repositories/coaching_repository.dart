import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:fpdart/fpdart.dart';

abstract class CoachingRepository {
  /// Returns a real-time stream of the coach's active clients.
  Stream<Either<Failure, List<ClientSummary>>> watchMyClients(String coachId);

  /// Generates a new unique invite code for this coach and stores it.
  Future<Either<Failure, String>> generateInviteCode(String coachId);

  /// Gets the total number of active clients for a coach.
  Future<Either<Failure, int>> getClientCount(String coachId);
}
