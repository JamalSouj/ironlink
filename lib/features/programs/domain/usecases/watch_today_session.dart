import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/workout_session.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

@injectable
class WatchTodaySession extends StreamUseCase<WorkoutSession?, String> {
  WatchTodaySession(this._repository);
  final ProgramsRepository _repository;

  @override
  Stream<Either<Failure, WorkoutSession?>> call(String params) {
    return _repository.watchTodaySession(params);
  }
}
