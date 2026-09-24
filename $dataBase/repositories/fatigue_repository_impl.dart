import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/fatigue/data/datasources/remote/supabase_fatigue_data_source.dart';
import 'package:ascent/features/fatigue/domain/entities/training_load_point.dart';
import 'package:ascent/features/fatigue/domain/repositories/fatigue_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FatigueRepository)
class FatigueRepositoryImpl implements FatigueRepository {
  const FatigueRepositoryImpl(this._dataSource);
  final SupabaseFatigueDataSource _dataSource;

  @override
  Stream<Either<Failure, List<TrainingLoadPoint>>> watchClientFatigueData(
    String clientId,
  ) {
    return _dataSource
        .watchClientFatigueData(clientId)
        .map((points) {
          return right<Failure, List<TrainingLoadPoint>>(points);
        })
        .handleError((dynamic error) {
          if (error is ServerException)
            return left<Failure, List<TrainingLoadPoint>>(
              ServerFailure(message: error.message),
            );
          return left<Failure, List<TrainingLoadPoint>>(
            ServerFailure(message: error.toString()),
          );
        });
  }
}
