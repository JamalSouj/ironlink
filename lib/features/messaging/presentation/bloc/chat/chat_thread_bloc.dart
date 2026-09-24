import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/messaging/domain/entities/message_entity.dart';
import 'package:ascent/features/messaging/domain/usecases/mark_thread_as_read.dart';
import 'package:ascent/features/messaging/domain/usecases/send_message.dart';
import 'package:ascent/features/messaging/domain/usecases/watch_thread.dart';
import 'package:ascent/features/messaging/presentation/bloc/chat/chat_thread_event.dart';
import 'package:ascent/features/messaging/presentation/bloc/chat/chat_thread_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChatThreadBloc extends Bloc<ChatThreadEvent, ChatThreadState> {
  ChatThreadBloc(
    this._watchThread,
    this._sendMessage,
    this._markThreadAsRead,
  ) : super(const ChatThreadState.initial()) {
    on<ChatThreadEvent>((event, emit) async {
      switch (event) {
        case final ChatThreadStarted e:
          await _onStarted(e, emit);
        case final ChatThreadMessageSent e:
          await _onMessageSent(e, emit);
      }
    });
  }

  final WatchThread _watchThread;
  final SendMessage _sendMessage;
  final MarkThreadAsRead _markThreadAsRead;

  Future<void> _onStarted(ChatThreadStarted e, Emitter<ChatThreadState> emit) async {
    emit(const ChatThreadState.loading());

    await emit.forEach<Either<Failure, List<MessageEntity>>>(
      _watchThread(WatchThreadParams(currentUserId: e.currentUserId, peerId: e.peerId)),
      onData: (either) => either.fold(
        (f) => ChatThreadState.error(failure: f),
        (messages) {
          _markThreadAsRead(MarkThreadAsReadParams(currentUserId: e.currentUserId, peerId: e.peerId));
          return ChatThreadState.loaded(messages: messages);
        },
      ),
      onError: (error, _) => ChatThreadState.error(failure: ServerFailure(message: error.toString())),
    );
  }

  Future<void> _onMessageSent(ChatThreadMessageSent e, Emitter<ChatThreadState> emit) async {
    await _sendMessage(SendMessageParams(senderId: e.currentUserId, recipientId: e.peerId, body: e.body));
  }
}
