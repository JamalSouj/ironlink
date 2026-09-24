import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/fatigue/domain/entities/training_load_point.dart';
import 'package:fpdart/fpdart.dart';

abstract class FatigueRepository {
  Stream<Either<Failure, List<TrainingLoadPoint>>> watchClientFatigueData(
    String clientId,
  );
}
