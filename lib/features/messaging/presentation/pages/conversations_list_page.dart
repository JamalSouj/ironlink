import 'package:ascent/core/di/injection.dart';
import 'package:ascent/features/auth/domain/entities/auth_user.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_state.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_bloc.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_event.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_state.dart';
import 'package:ascent/features/messaging/presentation/pages/chat_thread_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConversationsListPage extends StatelessWidget {
  const ConversationsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    AuthUser? currentUser;
    if (authState is AuthenticatedCoach) {
      currentUser = authState.user;
    }

    if (currentUser == null) {
      return const Scaffold(body: Center(child: Text('Not logged in')));
    }
    
    final currentUserId = currentUser.id;

    return BlocProvider(
      create: (context) => getIt<RosterBloc>()..add(const RosterEvent.started()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: BlocBuilder<RosterBloc, RosterState>(
          builder: (context, state) {
            return switch (state) {
              RosterInitial() ||
              RosterLoading() =>
                const Center(child: CircularProgressIndicator()),
              RosterLoaded(:final clients) => () {
                  if (clients.isEmpty) {
                    return const Center(
                      child: Text('You have no clients to message yet.'),
                    );
                  }
                  return ListView.builder(
                    itemCount: clients.length,
                    itemBuilder: (context, index) {
                      final clientSummary = clients[index];
                      final client = clientSummary.user;
                      return ListTile(
                        leading: CircleAvatar(child: Text(client.fullName[0])),
                        title: Text(client.fullName),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatThreadPage(
                                currentUserId: currentUserId,
                                peerId: client.id,
                                peerName: client.fullName,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }(),
              RosterError(:final failure) =>
                Center(child: Text('Error: ${failure.message}')),
            };
          },
        ),
      ),
    );
  }
}
