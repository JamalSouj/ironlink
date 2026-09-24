import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/workout_session.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class WatchUpcomingSessionsParams {
  final String clientId;
  final DateTime fromDate;
  const WatchUpcomingSessionsParams({
    required this.clientId,
    required this.fromDate,
  });
}

@injectable
class WatchUpcomingSessions
    extends StreamUseCase<List<WorkoutSession>, WatchUpcomingSessionsParams> {
  WatchUpcomingSessions(this._repository);
  final ProgramsRepository _repository;
  @override
  Stream<Either<Failure, List<WorkoutSession>>> call(
    WatchUpcomingSessionsParams params,
  ) {
    return _repository.watchUpcomingSessions(params.clientId, params.fromDate);
  }
}
