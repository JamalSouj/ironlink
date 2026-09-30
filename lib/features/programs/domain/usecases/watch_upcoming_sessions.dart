import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

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
