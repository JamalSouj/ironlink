import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/coaching/data/datasources/remote/supabase_coaching_data_source.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:ironlink/features/coaching/domain/repositories/coaching_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CoachingRepository)
class CoachingRepositoryImpl implements CoachingRepository {
  const CoachingRepositoryImpl(this._dataSource);

  final SupabaseCoachingDataSource _dataSource;

  @override
  Stream<Either<Failure, List<ClientSummary>>> watchMyClients(String coachId) {
    return _dataSource
        .watchMyClients(coachId)
        .map((models) {
          return right<Failure, List<ClientSummary>>(models);
        })
        .handleError((Object error) {
          if (error is ServerException) {
            return left<Failure, List<ClientSummary>>(
              ServerFailure(message: error.message),
            );
          }
          return left<Failure, List<ClientSummary>>(
            ServerFailure(message: error.toString()),
          );
        });
  }

  @override
  Future<Either<Failure, String>> generateInviteCode(String coachId) async {
    try {
      final code = await _dataSource.generateInviteCode(coachId);
      return right(code);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> getClientCount(String coachId) async {
    try {
      final count = await _dataSource.getClientCount(coachId);
      return right(count);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }
}
