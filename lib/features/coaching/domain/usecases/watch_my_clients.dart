import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:ironlink/features/coaching/domain/repositories/coaching_repository.dart';
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
