import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

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
    return await _repository.completeSession(params.sessionId, params.sessionRpe, params.durationMinutes);
  }
}
