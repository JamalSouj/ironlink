import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/messaging/domain/entities/message_entity.dart';

abstract class MessagingRepository {
  Stream<Either<Failure, List<MessageEntity>>> watchThread(
    String currentUserId,
    String peerId,
  );
  Stream<Either<Failure, int>> watchUnreadCount(String currentUserId);
  Future<Either<Failure, Unit>> sendMessage({
    required String senderId,
    required String recipientId,
    required String body,
  });
  Future<Either<Failure, Unit>> markThreadAsRead(
    String currentUserId,
    String peerId,
  );
}
