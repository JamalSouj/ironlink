import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/exercises/data/datasources/exercise_remote_datasource.dart';
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
}
