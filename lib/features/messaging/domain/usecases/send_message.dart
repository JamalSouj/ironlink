import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/messaging/domain/repositories/messaging_repository.dart';

class SendMessageParams {
  final String senderId;
  final String recipientId;
  final String body;
  const SendMessageParams({
    required this.senderId,
    required this.recipientId,
    required this.body,
  });
}

@injectable
class SendMessage extends UseCase<Unit, SendMessageParams> {
  SendMessage(this._repository);
  final MessagingRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SendMessageParams params) async {
    return await _repository.sendMessage(
      senderId: params.senderId,
      recipientId: params.recipientId,
      body: params.body,
    );
  }
}
