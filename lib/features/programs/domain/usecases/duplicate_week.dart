import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

class DuplicateWeekParams {
  final String blockId;
  final DateTime sourceWeekStart;
  final DateTime targetWeekStart;
  const DuplicateWeekParams({
    required this.blockId,
    required this.sourceWeekStart,
    required this.targetWeekStart,
  });
}

@injectable
class DuplicateWeek extends UseCase<Unit, DuplicateWeekParams> {
  DuplicateWeek(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(DuplicateWeekParams params) {
    return _repository.duplicateWeek(
      params.blockId,
      params.sourceWeekStart,
      params.targetWeekStart,
    );
  }
}
