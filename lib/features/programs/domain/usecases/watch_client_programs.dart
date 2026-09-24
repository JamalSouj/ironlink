import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/program.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchClientPrograms extends StreamUseCase<List<Program>, String> {
  WatchClientPrograms(this._repository);
  final ProgramsRepository _repository;
  @override
  Stream<Either<Failure, List<Program>>> call(String params) {
    return _repository.watchClientPrograms(params);
  }
}
