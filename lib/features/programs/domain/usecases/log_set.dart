import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/set_log.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogSet extends UseCase<Unit, SetLog> {
  LogSet(this._repository);
  final ProgramsRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SetLog params) async {
    return await _repository.logSet(params);
  }
}
