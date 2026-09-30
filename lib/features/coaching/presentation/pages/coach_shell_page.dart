import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_event.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_bloc.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_event.dart';
import 'package:ironlink/features/messaging/presentation/bloc/badge/unread_badge_state.dart';

class CoachShellPage extends StatelessWidget {
  const CoachShellPage({super.key, required this.child});
  
  final Widget child;

  int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.path;
    if (location.startsWith('/coach/dashboard')) return 0;
    if (location.startsWith('/coach/clients')) return 1;
    if (location.startsWith('/coach/messages')) return 2;
    if (location.startsWith('/coach/billing')) return 3;
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go('/coach/dashboard');
        break;
      case 1:
        context.go('/coach/clients');
        break;
      case 2:
        context.go('/coach/messages');
        break;
      case 3:
        context.go('/coach/billing');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    String? currentUserId;
    if (authState is AuthenticatedCoach) {
      currentUserId = authState.user.id;
    }

    if (currentUserId == null) {
      return const Scaffold(body: Center(child: Text('Not logged in')));
    }

    return BlocProvider(
      create: (context) => getIt<UnreadBadgeBloc>()..add(UnreadBadgeEvent.started(currentUserId: currentUserId!)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IronLink'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.read<AuthBloc>().add(const AuthEvent.signOutRequested()),
            ),
          ],
        ),
        body: child,
        bottomNavigationBar: Builder(
          builder: (context) {
            return BottomNavigationBar(
              currentIndex: _calculateSelectedIndex(context),
              onTap: (index) => _onItemTapped(index, context),
              type: BottomNavigationBarType.fixed,
              items: [
                const BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
                const BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Clients'),
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
                const BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Billing'),
              ],
            );
          }
        ),
      ),
    );
  }
}
