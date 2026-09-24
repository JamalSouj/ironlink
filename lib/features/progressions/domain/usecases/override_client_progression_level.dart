import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class OverrideClientProgressionLevelParams {
  final String clientId;
  final String progressionId;
  final String levelId;
  const OverrideClientProgressionLevelParams({
    required this.clientId,
    required this.progressionId,
    required this.levelId,
  });
}

@injectable
class OverrideClientProgressionLevel
    extends UseCase<Unit, OverrideClientProgressionLevelParams> {
  OverrideClientProgressionLevel(this._repository);
  final ProgressionsRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(
    OverrideClientProgressionLevelParams params,
  ) {
    return _repository.overrideClientProgressionLevel(
      clientId: params.clientId,
      progressionId: params.progressionId,
      levelId: params.levelId,
    );
  }
}
