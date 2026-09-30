import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

@injectable
class WatchProgramBlocks extends StreamUseCase<List<ProgramBlock>, String> {
  WatchProgramBlocks(this._repository);
  final ProgramsRepository _repository;
  @override
  Stream<Either<Failure, List<ProgramBlock>>> call(String params) {
    return _repository.watchProgramBlocks(params);
  }
}
