import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/program.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

@injectable
class WatchClientPrograms extends StreamUseCase<List<Program>, String> {
  WatchClientPrograms(this._repository);
  final ProgramsRepository _repository;
  @override
  Stream<Either<Failure, List<Program>>> call(String params) {
    return _repository.watchClientPrograms(params);
  }
}
