import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/programs/domain/entities/set_log.dart';
import 'package:ascent/features/programs/domain/repositories/programs_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class AddSetLogParams {
  final String workoutSessionId;
  final String exerciseId;
  final int setOrder;
  final int? prescribedReps;
  final double? prescribedLoadKg;
  final double? prescribedPct1Rm;
  final String? tempo;
  const AddSetLogParams({
    required this.workoutSessionId,
    required this.exerciseId,
    required this.setOrder,
    this.prescribedReps,
    this.prescribedLoadKg,
    this.prescribedPct1Rm,
    this.tempo,
  });
}

@injectable
class AddSetLog extends UseCase<SetLog, AddSetLogParams> {
  AddSetLog(this._repository);
  final ProgramsRepository _repository;
  @override
  Future<Either<Failure, SetLog>> call(AddSetLogParams params) {
    return _repository.addSetLog(
      params.workoutSessionId,
      params.exerciseId,
      params.setOrder,
      params.prescribedReps,
      params.prescribedLoadKg,
      params.prescribedPct1Rm,
      params.tempo,
    );
  }
}
