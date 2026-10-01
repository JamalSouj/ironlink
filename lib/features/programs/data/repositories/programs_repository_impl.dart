import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/network/sync_service.dart';
import 'package:ironlink/features/programs/data/datasources/local/hive_programs_data_source.dart';
import 'package:ironlink/features/programs/data/datasources/remote/supabase_programs_data_source.dart';
import 'package:ironlink/features/programs/data/models/set_log_model.dart';
import 'package:ironlink/features/programs/domain/entities/program.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:ironlink/features/programs/domain/entities/set_log.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

@LazySingleton(as: ProgramsRepository)
class ProgramsRepositoryImpl implements ProgramsRepository, SyncDelegate {
  ProgramsRepositoryImpl(this._dataSource, this._local, this._syncService) {
    _syncService.registerDelegate(this);
  }

  final SupabaseProgramsDataSource _dataSource;
  final HiveProgramsDataSource _local;
  final SyncService _syncService;

  @override
  Future<void> flushQueue() async {
    final sets = await _local.getQueuedSets();
    for (final s in sets) {
      try {
        await _dataSource.logSet(s);
        await _local.removeQueuedSet(s.id);
      } catch (_) {}
    }

    final sessions = await _local.getQueuedSessions();
    for (final s in sessions) {
      try {
        await _dataSource.completeSession(
          s['id'] as String,
          s['rpe'] as int,
          s['duration'] as int,
        );
        await _local.removeQueuedSession(s['id'] as String);
      } catch (_) {}
    }
  }

  @override
  Future<Either<Failure, Program>> createProgram(
    String coachId,
    String clientId,
    String name,
    DateTime startDate,
    DateTime? endDate,
  ) async {
    try {
      final model = await _dataSource.createProgram(
        coachId,
        clientId,
        name,
        startDate,
        endDate,
      );
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProgramBlock>> addProgramBlock(
    String programId,
    String name,
    int blockOrder,
    String? focus,
  ) async {
    try {
      final model = await _dataSource.addProgramBlock(
        programId,
        name,
        blockOrder,
        focus,
      );
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkoutSession>> scheduleWorkoutSession(
    String programBlockId,
    String clientId,
    DateTime scheduledDate,
  ) async {
    try {
      final model = await _dataSource.scheduleWorkoutSession(
        programBlockId,
        clientId,
        scheduledDate,
      );
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, SetLog>> addSetLog(
    String workoutSessionId,
    String exerciseId,
    int setOrder,
    int? prescribedReps,
    double? prescribedLoadKg,
    double? prescribedPct1Rm,
    String? tempo,
  ) async {
    try {
      final model = await _dataSource.addSetLog(
        workoutSessionId,
        exerciseId,
        setOrder,
        prescribedReps,
        prescribedLoadKg,
        prescribedPct1Rm,
        tempo,
      );
      return right(model.toDomain());
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> duplicateBlock(
    String blockId,
    int newBlockOrder,
  ) async {
    try {
      await _dataSource.duplicateBlock(blockId, newBlockOrder);
      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> duplicateWeek(
    String blockId,
    DateTime sourceWeekStart,
    DateTime targetWeekStart,
  ) async {
    try {
      await _dataSource.duplicateWeek(
        blockId,
        sourceWeekStart,
        targetWeekStart,
      );
      return right(unit);
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, List<Program>>> watchClientPrograms(
    String clientId,
  ) async* {
    try {
      await for (final models in _dataSource.watchClientPrograms(clientId)) {
        yield right<Failure, List<Program>>(
          models.map((m) => m.toDomain()).toList(),
        );
      }
    } catch (error) {
      if (error is ServerException) {
        yield left<Failure, List<Program>>(
          ServerFailure(message: error.message),
        );
      } else {
        yield left<Failure, List<Program>>(
          ServerFailure(message: error.toString()),
        );
      }
    }
  }

  @override
  Stream<Either<Failure, List<ProgramBlock>>> watchProgramBlocks(
    String programId,
  ) async* {
    try {
      await for (final models in _dataSource.watchProgramBlocks(programId)) {
        yield right<Failure, List<ProgramBlock>>(
          models.map((m) => m.toDomain()).toList(),
        );
      }
    } catch (error) {
      if (error is ServerException) {
        yield left<Failure, List<ProgramBlock>>(
          ServerFailure(message: error.message),
        );
      } else {
        yield left<Failure, List<ProgramBlock>>(
          ServerFailure(message: error.toString()),
        );
      }
    }
  }

  @override
  Stream<Either<Failure, List<WorkoutSession>>> watchUpcomingSessions(
    String clientId,
    DateTime fromDate,
  ) async* {
    try {
      await for (final models in _dataSource.watchUpcomingSessions(
        clientId,
        fromDate,
      )) {
        yield right<Failure, List<WorkoutSession>>(
          models.map((m) => m.toDomain()).toList(),
        );
      }
    } catch (error) {
      if (error is ServerException) {
        yield left<Failure, List<WorkoutSession>>(
          ServerFailure(message: error.message),
        );
      } else {
        yield left<Failure, List<WorkoutSession>>(
          ServerFailure(message: error.toString()),
        );
      }
    }
  }

  @override
  Stream<Either<Failure, WorkoutSession?>> watchTodaySession(
    String clientId,
  ) async* {
    try {
      await for (final session in _dataSource.watchTodaySession(clientId)) {
        yield right<Failure, WorkoutSession?>(session?.toDomain());
      }
    } catch (error) {
      if (error is ServerException) {
        yield left<Failure, WorkoutSession?>(
          ServerFailure(message: error.message),
        );
      } else {
        yield left<Failure, WorkoutSession?>(
          ServerFailure(message: error.toString()),
        );
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> logSet(SetLog log) async {
    try {
      final model = SetLogModel.fromDomain(log);
      if (_syncService.isOnline) {
        await _dataSource.logSet(model);
      } else {
        await _local.queueSetLog(model);
      }
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> completeSession(
    String sessionId,
    int sessionRpe,
    int durationMinutes,
  ) async {
    try {
      if (_syncService.isOnline) {
        await _dataSource.completeSession(
          sessionId,
          sessionRpe,
          durationMinutes,
        );
      } else {
        await _local.queueSessionCompletion(
          sessionId,
          sessionRpe,
          durationMinutes,
        );
      }
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
