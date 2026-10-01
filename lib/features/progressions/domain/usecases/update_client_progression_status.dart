import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';

class UpdateProgressionParams {
  const UpdateProgressionParams({
    required this.clientId,
    required this.progressionId,
    required this.newLevelId,
  });
  final String clientId;
  final String progressionId;
  final String newLevelId;
}

@injectable
class UpdateClientProgressionStatus
    extends UseCase<Unit, UpdateProgressionParams> {
  UpdateClientProgressionStatus(this._repository);
  final ProgressionsRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(UpdateProgressionParams params) async {
    // This leverages the coach's override use case logic fundamentally,
    // but triggered automatically by the system.
    return await _repository.overrideClientProgressionLevel(
      clientId: params.clientId,
      progressionId: params.progressionId,
      levelId: params.newLevelId,
    );
  }
}
