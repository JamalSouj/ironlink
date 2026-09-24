import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/progressions/domain/repositories/progressions_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

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
