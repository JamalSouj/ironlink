import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';
import 'package:ironlink/features/exercises/domain/repositories/exercise_repository.dart';

@injectable
class AddExercise implements UseCase<Exercise, Exercise> {
  final ExerciseRepository repository;

  AddExercise(this.repository);

  @override
  Future<Either<Failure, Exercise>> call(Exercise params) async {
    return await repository.addExercise(params);
  }
}
