import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/fatigue/data/datasources/remote/supabase_fatigue_data_source.dart';
import 'package:ironlink/features/fatigue/domain/entities/training_load_point.dart';
import 'package:ironlink/features/fatigue/domain/repositories/fatigue_repository.dart';

@LazySingleton(as: FatigueRepository)
class FatigueRepositoryImpl implements FatigueRepository {
  const FatigueRepositoryImpl(this._dataSource);
  final SupabaseFatigueDataSource _dataSource;

  @override
  Stream<Either<Failure, List<TrainingLoadPoint>>> watchClientFatigueData(
    String clientId,
  ) async* {
    try {
      await for (final points in _dataSource.watchClientFatigueData(clientId)) {
        yield right<Failure, List<TrainingLoadPoint>>(points);
      }
    } catch (error) {
      if (error is ServerException) {
        yield left<Failure, List<TrainingLoadPoint>>(
          ServerFailure(message: error.message),
        );
      } else {
        yield left<Failure, List<TrainingLoadPoint>>(
          ServerFailure(message: error.toString()),
        );
      }
    }
  }
}
