import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';

@injectable
class EvaluateProgressionUnlock extends UseCase<List<ProgressionLevel>, WorkoutSession> {
  EvaluateProgressionUnlock();

  @override
  Future<Either<Failure, List<ProgressionLevel>>> call(WorkoutSession params) async {
    // TODO: Implement actual progression unlock evaluation logic by querying
    // active progressions for the client and matching set logs against unlock_criteria
    return const Right([]);
  }
}
