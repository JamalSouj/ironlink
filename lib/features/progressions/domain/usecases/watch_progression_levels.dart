import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchProgressionLevels
    extends StreamUseCase<List<ProgressionLevel>, String> {
  WatchProgressionLevels(this._repository);
  final ProgressionsRepository _repository;
  @override
  Stream<Either<Failure, List<ProgressionLevel>>> call(String params) {
    return _repository.watchProgressionLevels(params);
  }
}
