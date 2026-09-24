import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/progressions/domain/entities/progression.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';
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
