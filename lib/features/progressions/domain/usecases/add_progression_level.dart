import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/progressions/domain/entities/progression_level.dart';
import 'package:ascent/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class AddProgressionLevelParams {
  final String progressionId;
  final String exerciseId;
  final int levelOrder;
  final Map<String, dynamic> unlockCriteria;
  const AddProgressionLevelParams({
    required this.progressionId,
    required this.exerciseId,
    required this.levelOrder,
    required this.unlockCriteria,
  });
}

@injectable
class AddProgressionLevel
    extends UseCase<ProgressionLevel, AddProgressionLevelParams> {
  AddProgressionLevel(this._repository);
  final ProgressionsRepository _repository;
  @override
  Future<Either<Failure, ProgressionLevel>> call(
    AddProgressionLevelParams params,
  ) {
    return _repository.addProgressionLevel(
      progressionId: params.progressionId,
      exerciseId: params.exerciseId,
      levelOrder: params.levelOrder,
      unlockCriteria: params.unlockCriteria,
    );
  }
}
