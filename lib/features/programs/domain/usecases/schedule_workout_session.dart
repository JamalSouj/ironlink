import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/workout_session.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class ScheduleWorkoutSessionParams {
  final String programBlockId;
  final String clientId;
  final DateTime scheduledDate;
  const ScheduleWorkoutSessionParams({
    required this.programBlockId,
    required this.clientId,
    required this.scheduledDate,
  });
}

@injectable
class ScheduleWorkoutSession
    extends UseCase<WorkoutSession, ScheduleWorkoutSessionParams> {
  ScheduleWorkoutSession(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, WorkoutSession>> call(
    ScheduleWorkoutSessionParams params,
  ) {
    return _repository.scheduleWorkoutSession(
      params.programBlockId,
      params.clientId,
      params.scheduledDate,
    );
  }
}
