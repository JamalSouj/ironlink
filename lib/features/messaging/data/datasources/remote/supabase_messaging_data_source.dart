import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/features/messaging/data/models/message_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

@lazySingleton
class SupabaseMessagingDataSource {
  const SupabaseMessagingDataSource(this._client);
  final sb.SupabaseClient _client;

  Stream<List<MessageModel>> watchThread(String currentUserId, String peerId) {
    return _client
        .from('messages')
        .stream(primaryKey: ['id'])
        .order('created_at', ascending: true)
        .map((data) {
          // Filter in memory for simplicity (Supabase stream filter is limited to eq on primary key usually, or realtime RLS covers it but we still want just this peer)
          final filtered = data.where((row) => 
            (row['sender_id'] == currentUserId && row['recipient_id'] == peerId) ||
            (row['sender_id'] == peerId && row['recipient_id'] == currentUserId)
          );
          return filtered.map((json) => MessageModel.fromJson(json)).toList();
        });
  }

  Stream<int> watchUnreadCount(String currentUserId) {
    return _client
        .from('messages')
        .stream(primaryKey: ['id'])
        .map((data) {
          return data.where((row) => row['recipient_id'] == currentUserId && row['read_at'] == null).length;
        });
  }

  Future<void> sendMessage(String senderId, String recipientId, String body) async {
    try {
      await _client.from('messages').insert({
        'sender_id': senderId,
        'recipient_id': recipientId,
        'body': body,
      });
    } catch (e) {
      throw ServerException(message: 'Failed to send message: $e');
    }
  }

  Future<void> markThreadAsRead(String currentUserId, String peerId) async {
    try {
      await _client
          .from('messages')
          .update({'read_at': DateTime.now().toIso8601String()})
          .eq('recipient_id', currentUserId)
          .eq('sender_id', peerId)
          .filter('read_at', 'is', null);
    } catch (e) {
      throw ServerException(message: 'Failed to mark as read: $e');
    }
  }
}
