import 'package:ascent/features/exercises/data/models/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getExercises();
}
