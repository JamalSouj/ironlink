import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/data/datasources/remote/supabase_progressions_data_source.dart';
import 'package:ironlink/features/progressions/domain/entities/client_progression_status.dart';
import 'package:ironlink/features/progressions/domain/entities/progression.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';

@LazySingleton(as: ProgressionsRepository)
class ProgressionsRepositoryImpl implements ProgressionsRepository {
  const ProgressionsRepositoryImpl(this._dataSource);

  final SupabaseProgressionsDataSource _dataSource;

  @override
  Stream<Either<Failure, List<Progression>>> watchCoachProgressions(
    String coachId,
  ) {
    return _dataSource
        .watchCoachProgressions(coachId)
        .map((models) {
          return right<Failure, List<Progression>>(
            models.map((m) => m.toDomain()).toList(),
          );
        })
        .handleError((Object error) {
          if (error is ServerException) {
            return left<Failure, List<Progression>>(
              ServerFailure(message: error.message),
            );
          }
          return left<Failure, List<Progression>>(
            ServerFailure(message: error.toString()),
          );
        });
  }

  @override
  Stream<Either<Failure, List<ProgressionLevel>>> watchProgressionLevels(
    String progressionId,
  ) {
    return _dataSource
        .watchProgressionLevels(progressionId)
        .map((models) {
          return right<Failure, List<ProgressionLevel>>(
            models.map((m) => m.toDomain()).toList(),
          );
        })
        .handleError((Object error) {
          if (error is ServerException) {
            return left<Failure, List<ProgressionLevel>>(
              ServerFailure(message: error.message),
            );
          }
          return left<Failure, List<ProgressionLevel>>(
            ServerFailure(message: error.toString()),
          );
        });
  }

  @override
  Future<Either<Failure, Progression>> createProgression(
    String name,
    String coachId,
  ) async {
    try {
      final model = await _dataSource.createProgression(name, coachId);
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProgressionLevel>> addProgressionLevel({
    required String progressionId,
    required String exerciseId,
    required int levelOrder,
    required Map<String, dynamic> unlockCriteria,
  }) async {
    try {
      final model = await _dataSource.addProgressionLevel(
        progressionId: progressionId,
        exerciseId: exerciseId,
        levelOrder: levelOrder,
        unlockCriteria: unlockCriteria,
      );
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> reorderProgressionLevels(
    List<Map<String, dynamic>> updates,
  ) async {
    try {
      await _dataSource.reorderProgressionLevels(updates);
      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<ClientProgressionStatus>>>
  watchClientProgressions(String clientId) {
    return _dataSource
        .watchClientProgressions(clientId)
        .map((models) {
          return right<Failure, List<ClientProgressionStatus>>(
            models.map((m) => m.toDomain()).toList(),
          );
        })
        .handleError((Object error) {
          if (error is ServerException) {
            return left<Failure, List<ClientProgressionStatus>>(
              ServerFailure(message: error.message),
            );
          }
          return left<Failure, List<ClientProgressionStatus>>(
            ServerFailure(message: error.toString()),
          );
        });
  }

  @override
  Future<Either<Failure, Unit>> overrideClientProgressionLevel({
    required String clientId,
    required String progressionId,
    required String levelId,
  }) async {
    try {
      await _dataSource.overrideClientProgressionLevel(
        clientId: clientId,
        progressionId: progressionId,
        levelId: levelId,
      );
      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
