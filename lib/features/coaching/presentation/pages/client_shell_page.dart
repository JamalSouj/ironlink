import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_bloc.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_event.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_state.dart';

class ClientShellPage extends StatelessWidget {
  const ClientShellPage({super.key, required this.child});
  
  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/client/today')) return 0;
    if (location.startsWith('/client/progressions')) return 1;
    if (location.startsWith('/client/messages')) return 2;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/client/today');
        break;
      case 1:
        context.go('/client/progressions');
        break;
      case 2:
        context.go('/client/messages');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    String? currentUserId;
    if (authState is AuthenticatedClient) {
      currentUserId = authState.user.id;
    }

    if (currentUserId == null) {
      return const Scaffold(body: Center(child: Text('Not logged in')));
    }

    return BlocProvider(
      create: (context) => getIt<UnreadBadgeBloc>()..add(UnreadBadgeEvent.started(currentUserId: currentUserId!)),
      child: Scaffold(
        body: child,
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              currentIndex: _calculateSelectedIndex(context),
              onTap: (index) => _onItemTapped(index, context),
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Today'),
                const BottomNavigationBarItem(icon: Icon(Icons.emoji_events), label: 'Progressions'),
                BottomNavigationBarItem(
                  icon: BlocBuilder<UnreadBadgeBloc, UnreadBadgeState>(
                    builder: (context, state) {
                      final count = state.count;
                      return Badge(
                        isLabelVisible: count > 0,
                        label: Text('$count'),
                        child: const Icon(Icons.message),
                      );
                    },
                  ),
                  label: 'Messages',
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
