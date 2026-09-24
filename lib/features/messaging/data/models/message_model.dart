import 'package:ascent/features/messaging/domain/entities/message_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
abstract class MessageModel with _$MessageModel {
  const MessageModel._();

  const factory MessageModel({
    required String id,
    required String senderId,
    required String recipientId,
    String? body,
    String? attachmentUrl,
    required DateTime createdAt,
    DateTime? readAt,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);

  MessageEntity toDomain() => MessageEntity(
        id: id,
        senderId: senderId,
        recipientId: recipientId,
        body: body,
        attachmentUrl: attachmentUrl,
        createdAt: createdAt,
        readAt: readAt,
      );

  static MessageModel fromDomain(MessageEntity entity) => MessageModel(
        id: entity.id,
        senderId: entity.senderId,
        recipientId: entity.recipientId,
        body: entity.body,
        attachmentUrl: entity.attachmentUrl,
        createdAt: entity.createdAt,
        readAt: entity.readAt,
      );
}
