import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<Exercise>>> getExercises();
  Future<Either<Failure, Exercise>> addExercise(Exercise exercise);
}
