import 'package:fpdart/fpdart.dart';
import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/exercises/domain/entities/exercise.dart';
import 'package:ascent/features/exercises/domain/repositories/exercise_repository.dart';

class GetExercises {
  final ExerciseRepository repository;

  GetExercises(this.repository);

  Future<Either<Failure, List<Exercise>>> call() async {
    return await repository.getExercises();
  }
}
