import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/progressions/domain/entities/progression.dart';
import 'package:ascent/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class CreateProgressionParams {
  final String name;
  final String coachId;
  const CreateProgressionParams({required this.name, required this.coachId});
}

@injectable
class CreateProgression extends UseCase<Progression, CreateProgressionParams> {
  CreateProgression(this._repository);
  final ProgressionsRepository _repository;
  @override
  Future<Either<Failure, Progression>> call(CreateProgressionParams params) {
    return _repository.createProgression(params.name, params.coachId);
  }
}
