import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/progressions/domain/entities/client_progression_status.dart';
import 'package:ascent/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchClientProgressions
    extends StreamUseCase<List<ClientProgressionStatus>, String> {
  WatchClientProgressions(this._repository);
  final ProgressionsRepository _repository;
  @override
  Stream<Either<Failure, List<ClientProgressionStatus>>> call(String params) {
    return _repository.watchClientProgressions(params);
  }
}
