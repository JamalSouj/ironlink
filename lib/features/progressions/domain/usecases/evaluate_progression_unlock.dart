import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';

@injectable
class EvaluateProgressionUnlock
    extends UseCase<List<ProgressionLevel>, WorkoutSession> {
  EvaluateProgressionUnlock();

  @override
  Future<Either<Failure, List<ProgressionLevel>>> call(
    WorkoutSession params,
  ) async {
    final unlocked = <ProgressionLevel>[];

    for (final setLog in params.setLogs) {
      final actualReps = setLog.actualReps ?? 0;
      final prescribedReps = setLog.prescribedReps ?? 0;
      final actualRpe = setLog.actualRpe ?? 10.0;

      // Basic progression logic: if you beat the reps and it was easy (RPE <= 7.5), you level up!
      if (actualReps > 0 && actualReps >= prescribedReps && actualRpe <= 7.5) {
        unlocked.add(
          ProgressionLevel(
            id: 'mock-level-up-${setLog.exerciseId}',
            progressionId: 'progression-1',
            exerciseId: setLog.exerciseId,
            levelOrder: 2,
            unlockCriteria: const {'max_rpe': 7.5},
          ),
        );
      }
    }

    return Right(unlocked);
  }
}
