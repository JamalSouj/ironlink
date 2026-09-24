import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class DuplicateBlockParams {
  final String blockId;
  final int newBlockOrder;
  const DuplicateBlockParams({
    required this.blockId,
    required this.newBlockOrder,
  });
}

@injectable
class DuplicateBlock extends UseCase<Unit, DuplicateBlockParams> {
  DuplicateBlock(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(DuplicateBlockParams params) {
    return _repository.duplicateBlock(params.blockId, params.newBlockOrder);
  }
}
