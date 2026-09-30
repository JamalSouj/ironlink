import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/messaging/presentation/bloc/chat/chat_thread_bloc.dart';
import 'package:ironlink/features/messaging/presentation/bloc/chat/chat_thread_event.dart';
import 'package:ironlink/features/messaging/presentation/bloc/chat/chat_thread_state.dart';

class ChatThreadPage extends StatefulWidget {
  const ChatThreadPage({
    super.key,
    required this.currentUserId,
    required this.peerId,
    required this.peerName,
  });

  final String currentUserId;
  final String peerId;
  final String peerName;

  @override
  State<ChatThreadPage> createState() => _ChatThreadPageState();
}

class _ChatThreadPageState extends State<ChatThreadPage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage(BuildContext context) {
    if (_controller.text.trim().isEmpty) return;
    context.read<ChatThreadBloc>().add(
          ChatThreadEvent.messageSent(
            currentUserId: widget.currentUserId,
            peerId: widget.peerId,
            body: _controller.text.trim(),
          ),
        );
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatThreadBloc>()
        ..add(ChatThreadEvent.started(
            currentUserId: widget.currentUserId, peerId: widget.peerId)),
      child: Scaffold(
        appBar: AppBar(title: Text(widget.peerName)),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatThreadBloc, ChatThreadState>(
                builder: (context, state) {
                  return switch (state) {
                    ChatThreadLoading() => const Center(child: CircularProgressIndicator()),
                    ChatThreadLoaded(:final messages) => () {
                      if (messages.isEmpty) {
                        return const Center(child: Text('Say hi!'));
                      }
                      return ListView.builder(
                        controller: _scrollController,
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final reversedMessages = messages.reversed.toList();
                          final msg = reversedMessages[index];
                          final isMe = msg.senderId == widget.currentUserId;
                          final theme = Theme.of(context).colorScheme;
                          
                          return Align(
                            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isMe ? theme.primaryContainer : theme.surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    msg.body ?? '',
                                    style: TextStyle(
                                      color: isMe ? theme.onPrimaryContainer : theme.onSurfaceVariant,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat.jm().format(msg.createdAt.toLocal()),
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: isMe ? theme.onPrimaryContainer.withValues(alpha: 0.7) : theme.onSurfaceVariant.withValues(alpha: 0.7),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }(),
                    ChatThreadError(:final failure) => Center(child: Text('Error: ${failure.message}')),
                    _ => const SizedBox.shrink(),
                  };
                },
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(),
                        ),
                        onSubmitted: (_) {
                          // need context from BlocBuilder, but Builder handles it
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Builder(
                      builder: (context) => IconButton(
                        icon: const Icon(Icons.send),
                        tooltip: 'Send message',
                        onPressed: () => _sendMessage(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
