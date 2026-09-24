import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/program.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class CreateProgramParams {
  final String coachId;
  final String clientId;
  final String name;
  final DateTime startDate;
  final DateTime? endDate;
  const CreateProgramParams({
    required this.coachId,
    required this.clientId,
    required this.name,
    required this.startDate,
    this.endDate,
  });
}

@injectable
class CreateProgram extends UseCase<Program, CreateProgramParams> {
  CreateProgram(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, Program>> call(CreateProgramParams params) {
    return _repository.createProgram(
      params.coachId,
      params.clientId,
      params.name,
      params.startDate,
      params.endDate,
    );
  }
}
