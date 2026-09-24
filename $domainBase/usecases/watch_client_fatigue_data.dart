import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/fatigue/domain/entities/training_load_point.dart';
import 'package:ascent/features/fatigue/domain/repositories/fatigue_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchClientFatigueData
    extends StreamUseCase<List<TrainingLoadPoint>, String> {
  WatchClientFatigueData(this._repository);
  final FatigueRepository _repository;
  @override
  Stream<Either<Failure, List<TrainingLoadPoint>>> call(String params) {
    return _repository.watchClientFatigueData(params);
  }
}
