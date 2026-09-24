import 'package:ascent/core/di/injection.dart';
import 'package:ascent/features/coaching/presentation/bloc/invite/invite_bloc.dart';
import 'package:ascent/features/coaching/presentation/bloc/invite/invite_event.dart';
import 'package:ascent/features/coaching/presentation/bloc/invite/invite_state.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_bloc.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_event.dart';
import 'package:ascent/features/coaching/presentation/bloc/roster/roster_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RosterPage extends StatelessWidget {
  const RosterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<RosterBloc>()..add(const RosterEvent.started()),
        ),
        BlocProvider(create: (_) => getIt<InviteBloc>()),
      ],
      child: const _RosterView(),
    );
  }
}

class _RosterView extends StatelessWidget {
  const _RosterView();

  void _showInviteModal(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return BlocProvider.value(
          value: context.read<InviteBloc>(),
          child: AlertDialog(
            title: const Text('Invite Client'),
            content: BlocBuilder<InviteBloc, InviteState>(
              builder: (context, state) {
                return switch (state) {
                  InviteInitial() => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Generate a unique invite code for a new client.',
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<InviteBloc>().add(
                          const InviteEvent.generatePressed(),
                        ),
                        child: const Text('Generate Code'),
                      ),
                    ],
                  ),
                  InviteGenerating() => const CircularProgressIndicator(),
                  InviteGenerated(:final inviteCode) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Invite Code:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      SelectableText(
                        inviteCode,
                        style: const TextStyle(
                          fontSize: 24,
                          letterSpacing: 2.0,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextButton.icon(
                        icon: const Icon(Icons.copy),
                        label: const Text('Copy to Clipboard'),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: inviteCode));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Copied!')),
                          );
                        },
                      ),
                    ],
                  ),
                  InviteError(:final failure) => Text('Error: ${failure.message}'),
                };
              },
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Roster')),
      body: BlocBuilder<RosterBloc, RosterState>(
        builder: (context, state) {
          return switch (state) {
            RosterInitial() ||
            RosterLoading() =>
              const Center(child: CircularProgressIndicator()),
            RosterError(:final failure) =>
              Center(child: Text('Error loading roster: ${failure.message}')),
            RosterLoaded(:final clients) => () {
                if (clients.isEmpty) {
                  return const Center(
                    child: Text('No clients yet. Invite someone!'),
                  );
                }
                return ListView.builder(
                  itemCount: clients.length,
                  itemBuilder: (context, index) {
                    final client = clients[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: client.user.avatarUrl != null
                            ? NetworkImage(client.user.avatarUrl!)
                            : null,
                        child: client.user.avatarUrl == null
                            ? Text(client.user.fullName[0])
                            : null,
                      ),
                      title: Text(client.user.fullName),
                      subtitle: Text(
                        client.activeProgramName ?? 'No Active Program',
                      ),
                      trailing: client.latestReadinessScore != null
                          ? Chip(
                              label: Text(
                                'Readiness: ${client.latestReadinessScore}',
                              ),
                            )
                          : const SizedBox.shrink(),
                      onTap: () {
                        // Navigate to Client Detail Page (to be built or connected via go_router)
                      },
                    );
                  },
                );
              }(),
          };
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showInviteModal(context),
        icon: const Icon(Icons.person_add),
        label: const Text('Invite'),
      ),
    );
  }
}
