import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ClientMessagesPage extends StatefulWidget {
  const ClientMessagesPage({Key? key}) : super(key: key);

  @override
  State<ClientMessagesPage> createState() => _ClientMessagesPageState();
}

class _ClientMessagesPageState extends State<ClientMessagesPage> {
  final TextEditingController _controller = TextEditingController();
  
  final List<Map<String, dynamic>> messages = [
    {'text': 'Hey Alex, how did the Front Levers feel today?', 'isMe': false, 'time': '10:42 AM'},
    {'text': 'Felt solid. I think I can bump the hold time up next session.', 'isMe': true, 'time': '10:45 AM'},
    {'text': 'Great. I\'ll adjust your macrocycle for next week.', 'isMe': false, 'time': '11:00 AM'},
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 14,
              backgroundColor: colors.surface2,
              child: Text('C', style: textTheme.labelMedium),
            ),
            const SizedBox(width: 12),
            const Text('Coach'),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final msg = messages[index];
                  final isMe = msg['isMe'] as bool;

                  return Align(
                    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: isMe ? colors.accent : colors.surface1,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(16),
                          topRight: const Radius.circular(16),
                          bottomLeft: Radius.circular(isMe ? 16 : 4),
                          bottomRight: Radius.circular(isMe ? 4 : 16),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            msg['text'] as String,
                            style: textTheme.bodyLarge?.copyWith(
                              color: isMe ? Colors.white : colors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            msg['time'] as String,
                            style: AppTextStyles.dataStyle(colors, fontSize: 10).copyWith(
                              color: isMe ? Colors.white70 : colors.textSecondary,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
            // Input Area
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: colors.background,
                border: Border(top: BorderSide(color: colors.surface2, width: 1)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      style: textTheme.bodyLarge,
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        hintStyle: textTheme.bodyLarge?.copyWith(color: colors.textSecondary),
                        filled: true,
                        fillColor: colors.surface1,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: colors.accent,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white, size: 20),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
