import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/client_progression_status.dart';
import 'package:ironlink/features/progressions/domain/entities/progression.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';

abstract class ProgressionsRepository {
  Stream<Either<Failure, List<Progression>>> watchCoachProgressions(
    String coachId,
  );

  Stream<Either<Failure, List<ProgressionLevel>>> watchProgressionLevels(
    String progressionId,
  );

  Future<Either<Failure, Progression>> createProgression(
    String name,
    String coachId,
  );

  Future<Either<Failure, ProgressionLevel>> addProgressionLevel({
    required String progressionId,
    required String exerciseId,
    required int levelOrder,
    required Map<String, dynamic> unlockCriteria,
  });

  /// Updates the `levelOrder` of multiple levels at once.
  /// Expects a list of maps with 'id' and 'level_order'.
  Future<Either<Failure, Unit>> reorderProgressionLevels(
    List<Map<String, dynamic>> updates,
  );

  Stream<Either<Failure, List<ClientProgressionStatus>>>
  watchClientProgressions(String clientId);

  Future<Either<Failure, Unit>> overrideClientProgressionLevel({
    required String clientId,
    required String progressionId,
    required String levelId,
  });
}
