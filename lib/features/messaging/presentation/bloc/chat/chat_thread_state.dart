import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/messaging/domain/entities/message_entity.dart';

part 'chat_thread_state.freezed.dart';

@freezed
sealed class ChatThreadState with _$ChatThreadState {
  const factory ChatThreadState.initial() = ChatThreadInitial;
  const factory ChatThreadState.loading() = ChatThreadLoading;
  const factory ChatThreadState.loaded({
    required List<MessageEntity> messages,
  }) = ChatThreadLoaded;
  const factory ChatThreadState.error({required Failure failure}) =
      ChatThreadError;
}
