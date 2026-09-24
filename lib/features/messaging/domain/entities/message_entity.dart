class MessageEntity {
  final String id;
  final String senderId;
  final String recipientId;
  final String? body;
  final String? attachmentUrl;
  final DateTime createdAt;
  final DateTime? readAt;

  const MessageEntity({
    required this.id,
    required this.senderId,
    required this.recipientId,
    this.body,
    this.attachmentUrl,
    required this.createdAt,
    this.readAt,
  });

  bool get isRead => readAt != null;
}
