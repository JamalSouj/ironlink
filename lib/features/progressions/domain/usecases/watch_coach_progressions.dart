import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/progressions/domain/entities/progression.dart';
import 'package:ascent/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchCoachProgressions extends StreamUseCase<List<Progression>, String> {
  WatchCoachProgressions(this._repository);
  final ProgressionsRepository _repository;
  @override
  Stream<Either<Failure, List<Progression>>> call(String params) {
    return _repository.watchCoachProgressions(params);
  }
}
