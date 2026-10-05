import 'package:ironlink/features/exercises/data/models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getExercises();
  Future<ExerciseModel> addExercise(ExerciseModel exercise);
}
