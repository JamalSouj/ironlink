import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/readiness/domain/entities/readiness_log.dart';

abstract class ReadinessRepository {
  Future<Either<Failure, Unit>> submitReadiness(ReadinessLog log);
  Future<Either<Failure, ReadinessLog?>> checkTodayReadiness(String clientId);
}
