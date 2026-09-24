import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/readiness/domain/entities/readiness_log.dart';
import 'package:ironlink/features/readiness/domain/repositories/readiness_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class SubmitReadiness extends UseCase<Unit, ReadinessLog> {
  SubmitReadiness(this._repository);
  final ReadinessRepository _repository;
  
  @override
  Future<Either<Failure, Unit>> call(ReadinessLog params) async {
    return await _repository.submitReadiness(params);
  }
}
