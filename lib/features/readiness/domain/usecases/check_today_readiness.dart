import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/readiness/domain/entities/readiness_log.dart';
import 'package:ascent/features/readiness/domain/repositories/readiness_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckTodayReadiness extends UseCase<ReadinessLog?, String> {
  CheckTodayReadiness(this._repository);
  final ReadinessRepository _repository;
  
  @override
  Future<Either<Failure, ReadinessLog?>> call(String params) async {
    return await _repository.checkTodayReadiness(params);
  }
}
