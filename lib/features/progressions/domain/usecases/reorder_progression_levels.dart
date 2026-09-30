import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/progressions/domain/repositories/progressions_repository.dart';

@injectable
class ReorderProgressionLevels
    extends UseCase<Unit, List<Map<String, dynamic>>> {
  ReorderProgressionLevels(this._repository);
  final ProgressionsRepository _repository;
  @override
  Future<Either<Failure, Unit>> call(List<Map<String, dynamic>> params) {
    return _repository.reorderProgressionLevels(params);
  }
}
