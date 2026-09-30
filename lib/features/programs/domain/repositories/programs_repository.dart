import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/programs/domain/entities/program.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:ironlink/features/programs/domain/entities/set_log.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';

abstract class ProgramsRepository {
  Future<Either<Failure, Program>> createProgram(
    String coachId,
    String clientId,
    String name,
    DateTime startDate,
    DateTime? endDate,
  );
  Future<Either<Failure, ProgramBlock>> addProgramBlock(
    String programId,
    String name,
    int blockOrder,
    String? focus,
  );
  Future<Either<Failure, WorkoutSession>> scheduleWorkoutSession(
    String programBlockId,
    String clientId,
    DateTime scheduledDate,
  );
  Future<Either<Failure, SetLog>> addSetLog(
    String workoutSessionId,
    String exerciseId,
    int setOrder,
    int? prescribedReps,
    double? prescribedLoadKg,
    double? prescribedPct1Rm,
    String? tempo,
  );

  Future<Either<Failure, Unit>> duplicateBlock(
    String blockId,
    int newBlockOrder,
  );
  Future<Either<Failure, Unit>> duplicateWeek(
    String blockId,
    DateTime sourceWeekStart,
    DateTime targetWeekStart,
  );

  Stream<Either<Failure, List<Program>>> watchClientPrograms(String clientId);
  Stream<Either<Failure, List<ProgramBlock>>> watchProgramBlocks(
    String programId,
  );
  Stream<Either<Failure, List<WorkoutSession>>> watchUpcomingSessions(
    String clientId,
    DateTime fromDate,
  );

  Stream<Either<Failure, WorkoutSession?>> watchTodaySession(String clientId);
  Future<Either<Failure, Unit>> logSet(SetLog log);
  Future<Either<Failure, Unit>> completeSession(String sessionId, int sessionRpe, int durationMinutes);
}
