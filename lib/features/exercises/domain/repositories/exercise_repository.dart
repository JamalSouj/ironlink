import 'package:fpdart/fpdart.dart';
import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/exercises/domain/entities/exercise.dart';

abstract class ExerciseRepository {
  Future<Either<Failure, List<Exercise>>> getExercises();
}
