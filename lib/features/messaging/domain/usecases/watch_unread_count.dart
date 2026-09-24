import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchUnreadCount extends StreamUseCase<int, String> {
  WatchUnreadCount(this._repository);
  final MessagingRepository _repository;
  
  @override
  Stream<Either<Failure, int>> call(String params) {
    return _repository.watchUnreadCount(params);
  }
}
