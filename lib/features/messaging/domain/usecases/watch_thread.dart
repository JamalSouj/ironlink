import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/messaging/domain/entities/message_entity.dart';
import 'package:ascent/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class WatchThreadParams {
  final String currentUserId;
  final String peerId;
  const WatchThreadParams({required this.currentUserId, required this.peerId});
}

@injectable
class WatchThread extends StreamUseCase<List<MessageEntity>, WatchThreadParams> {
  WatchThread(this._repository);
  final MessagingRepository _repository;
  
  @override
  Stream<Either<Failure, List<MessageEntity>>> call(WatchThreadParams params) {
    return _repository.watchThread(params.currentUserId, params.peerId);
  }
}
