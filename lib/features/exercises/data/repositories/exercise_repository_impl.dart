import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/exercises/data/datasources/exercise_remote_datasource.dart';
import 'package:ironlink/features/exercises/data/models/exercise_model.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';
import 'package:ironlink/features/exercises/domain/repositories/exercise_repository.dart';

@LazySingleton(as: ExerciseRepository)
class ExerciseRepositoryImpl implements ExerciseRepository {
  final ExerciseRemoteDataSource remoteDataSource;

  ExerciseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, List<Exercise>>> getExercises() async {
    try {
      final models = await remoteDataSource.getExercises();
      final entities = models.map((m) => m.toDomain()).toList();
      return Right(entities);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Exercise>> addExercise(Exercise exercise) async {
    try {
      final model = ExerciseModel(
        id: exercise.id,
        name: exercise.name,
        category: exercise.category,
        demoVideoUrl: exercise.demoVideoUrl,
        createdBy: exercise.createdBy,
        createdAt: exercise.createdAt,
      );
      final result = await remoteDataSource.addExercise(model);
      return Right(result.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
