import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class AddProgramBlockParams {
  final String programId;
  final String name;
  final int blockOrder;
  final String? focus;
  const AddProgramBlockParams({
    required this.programId,
    required this.name,
    required this.blockOrder,
    this.focus,
  });
}

@injectable
class AddProgramBlock extends UseCase<ProgramBlock, AddProgramBlockParams> {
  AddProgramBlock(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, ProgramBlock>> call(AddProgramBlockParams params) {
    return _repository.addProgramBlock(
      params.programId,
      params.name,
      params.blockOrder,
      params.focus,
    );
  }
}
