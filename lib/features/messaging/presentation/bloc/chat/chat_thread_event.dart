import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_thread_event.freezed.dart';

@freezed
sealed class ChatThreadEvent with _$ChatThreadEvent {
  const factory ChatThreadEvent.started({required String currentUserId, required String peerId}) = ChatThreadStarted;
  const factory ChatThreadEvent.messageSent({required String currentUserId, required String peerId, required String body}) = ChatThreadMessageSent;
}
