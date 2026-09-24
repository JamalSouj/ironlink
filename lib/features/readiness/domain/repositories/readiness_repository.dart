import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/readiness/domain/entities/readiness_log.dart';
import 'package:fpdart/fpdart.dart';

abstract class ReadinessRepository {
  Future<Either<Failure, Unit>> submitReadiness(ReadinessLog log);
  Future<Either<Failure, ReadinessLog?>> checkTodayReadiness(String clientId);
}
