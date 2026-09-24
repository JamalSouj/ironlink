import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/messaging/domain/repositories/messaging_repository.dart';
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
