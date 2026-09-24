import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/messaging/data/datasources/remote/supabase_messaging_data_source.dart';
import 'package:ascent/features/messaging/domain/entities/message_entity.dart';
import 'package:ascent/features/messaging/domain/repositories/messaging_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: MessagingRepository)
class MessagingRepositoryImpl implements MessagingRepository {
  MessagingRepositoryImpl(this._remote);

  final SupabaseMessagingDataSource _remote;

  @override
  Stream<Either<Failure, List<MessageEntity>>> watchThread(String currentUserId, String peerId) {
    return _remote.watchThread(currentUserId, peerId).map((models) {
      return right<Failure, List<MessageEntity>>(models.map((m) => m.toDomain()).toList());
    }).handleError((dynamic error) {
      if (error is ServerException) {
        return left<Failure, List<MessageEntity>>(ServerFailure(message: error.message));
      }
      return left<Failure, List<MessageEntity>>(ServerFailure(message: error.toString()));
    });
  }

  @override
  Stream<Either<Failure, int>> watchUnreadCount(String currentUserId) {
    return _remote.watchUnreadCount(currentUserId).map((count) {
      return right<Failure, int>(count);
    }).handleError((dynamic error) {
      if (error is ServerException) {
        return left<Failure, int>(ServerFailure(message: error.message));
      }
      return left<Failure, int>(ServerFailure(message: error.toString()));
    });
  }

  @override
  Future<Either<Failure, Unit>> sendMessage({
    required String senderId,
    required String recipientId,
    required String body,
  }) async {
    try {
      await _remote.sendMessage(senderId, recipientId, body);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Unit>> markThreadAsRead(String currentUserId, String peerId) async {
    try {
      await _remote.markThreadAsRead(currentUserId, peerId);
      return const Right(unit);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
