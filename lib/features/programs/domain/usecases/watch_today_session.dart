import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/workout_session.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchTodaySession extends StreamUseCase<WorkoutSession?, String> {
  WatchTodaySession(this._repository);
  final ProgramsRepository _repository;

  @override
  Stream<Either<Failure, WorkoutSession?>> call(String params) {
    return _repository.watchTodaySession(params);
  }
}
