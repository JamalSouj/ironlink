import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/readiness/domain/entities/readiness_log.dart';
import 'package:ironlink/features/readiness/domain/repositories/readiness_repository.dart';
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
