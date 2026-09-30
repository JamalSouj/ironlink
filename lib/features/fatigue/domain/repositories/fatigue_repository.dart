import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/fatigue/domain/entities/training_load_point.dart';

abstract class FatigueRepository {
  Stream<Either<Failure, List<TrainingLoadPoint>>> watchClientFatigueData(
    String clientId,
  );
}
