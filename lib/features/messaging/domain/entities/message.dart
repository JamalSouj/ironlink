final class Message {
  const Message({
    required this.id,
    required this.senderId,
    required this.recipientId,
    this.body,
    this.attachmentUrl,
    this.createdAt,
    this.readAt,
  });

  final String id;
  final String senderId;
  final String recipientId;
  final String? body;
  final String? attachmentUrl;
  final DateTime? createdAt;
  final DateTime? readAt;
}
