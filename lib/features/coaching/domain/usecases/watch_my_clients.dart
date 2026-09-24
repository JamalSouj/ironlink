import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/coaching/domain/entities/client_summary.dart';
import 'package:ascent/features/coaching/domain/repositories/coaching_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchMyClients extends StreamUseCase<List<ClientSummary>, String> {
  WatchMyClients(this._repository);

  final CoachingRepository _repository;

  @override
  Stream<Either<Failure, List<ClientSummary>>> call(String params) {
    return _repository.watchMyClients(params);
  }
}
