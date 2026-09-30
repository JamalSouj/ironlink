import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/programs/domain/entities/set_log.dart';
import 'package:ironlink/features/programs/domain/repositories/programs_repository.dart';

@injectable
class LogSet extends UseCase<Unit, SetLog> {
  LogSet(this._repository);
  final ProgramsRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SetLog params) async {
    return await _repository.logSet(params);
  }
}
