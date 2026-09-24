import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/program_block.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchProgramBlocks extends StreamUseCase<List<ProgramBlock>, String> {
  WatchProgramBlocks(this._repository);
  final ProgramsRepository _repository;
  @override
  Stream<Either<Failure, List<ProgramBlock>>> call(String params) {
    return _repository.watchProgramBlocks(params);
  }
}
