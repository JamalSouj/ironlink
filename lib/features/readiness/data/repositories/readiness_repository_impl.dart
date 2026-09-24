import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/network/sync_service.dart';
import 'package:ironlink/features/readiness/data/datasources/local/hive_readiness_data_source.dart';
import 'package:ironlink/features/readiness/data/datasources/remote/supabase_readiness_data_source.dart';
import 'package:ironlink/features/readiness/data/models/readiness_log_model.dart';
import 'package:ironlink/features/readiness/domain/entities/readiness_log.dart';
import 'package:ironlink/features/readiness/domain/repositories/readiness_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ReadinessRepository)
class ReadinessRepositoryImpl implements ReadinessRepository, SyncDelegate {
  ReadinessRepositoryImpl(this._remote, this._local, this._syncService) {
    _syncService.registerDelegate(this);
  }

  final SupabaseReadinessDataSource _remote;
  final HiveReadinessDataSource _local;
  final SyncService _syncService;

  @override
  Future<void> flushQueue() async {
    final queued = await _local.getQueuedSubmissions();
    for (final log in queued) {
      try {
        await _remote.submitReadiness(log);
        await _local.removeQueuedSubmission(log.id);
      } catch (e) {
        // Will retry later
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> submitReadiness(ReadinessLog log) async {
    try {
      final model = ReadinessLogModel.fromDomain(log);
      if (_syncService.isOnline) {
        await _remote.submitReadiness(model);
      } else {
        await _local.queueReadinessSubmission(model);
      }
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ReadinessLog?>> checkTodayReadiness(String clientId) async {
    try {
      // If offline, check local queue first for today
      final queued = await _local.getQueuedSubmissions();
      final today = DateTime.now().toIso8601String().split('T').first;
      for (final q in queued) {
        if (q.clientId == clientId && q.logDate.toIso8601String().split('T').first == today) {
          return Right(q.toDomain());
        }
      }
      
      if (!_syncService.isOnline) return const Right(null);

      final result = await _remote.checkTodayReadiness(clientId);
      return Right(result?.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
