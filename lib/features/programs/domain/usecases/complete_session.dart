import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

class CompleteSessionParams {
  const CompleteSessionParams({
    required this.sessionId,
    required this.sessionRpe,
    required this.durationMinutes,
  });
  final String sessionId;
  final int sessionRpe;
  final int durationMinutes;
}

@injectable
class CompleteSession extends UseCase<Unit, CompleteSessionParams> {
  CompleteSession(this._repository);
  final ProgramsRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(CompleteSessionParams params) async {
    return await _repository.completeSession(
      params.sessionId,
      params.sessionRpe,
      params.durationMinutes,
    );
  }
}
