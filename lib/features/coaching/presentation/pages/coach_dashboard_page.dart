import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:go_router/go_router.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:ironlink/features/programs/domain/usecases/create_program.dart';
import 'package:ironlink/features/coaching/presentation/bloc/roster/roster_bloc.dart';
import 'package:ironlink/features/coaching/presentation/bloc/roster/roster_event.dart';
import 'package:ironlink/features/coaching/presentation/bloc/roster/roster_state.dart';

class CoachDashboardPage extends StatelessWidget {
  const CoachDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RosterBloc>()..add(const RosterEvent.started()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView();

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    String coachName = 'Coach';
    String coachId = '';
    if (authState is AuthenticatedCoach) {
      coachName = authState.user.fullName;
      coachId = authState.user.id;
    }

    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: BlocBuilder<RosterBloc, RosterState>(
        builder: (context, state) {
          return switch (state) {
            RosterInitial() ||
            RosterLoading() => const Center(child: CircularProgressIndicator()),
            RosterError(:final failure) => Center(
              child: Text('Failed to load dashboard: ${failure.message}'),
            ),
            RosterLoaded(:final clients) => RefreshIndicator(
              onRefresh: () async {
                context.read<RosterBloc>().add(const RosterEvent.started());
              },
              child: ListView(
                padding: const EdgeInsets.all(16.0),
                children: [
                  Text(
                    'Welcome back, $coachName!',
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildStatCards(context, clients),
                  const SizedBox(height: 32),
                  Text('Quick Actions', style: theme.textTheme.titleLarge),
                  const SizedBox(height: 16),
                  _buildQuickActions(context, coachId, clients),
                ],
              ),
            ),
          };
        },
      ),
    );
  }

  Widget _buildStatCards(BuildContext context, List<dynamic> clients) {
    final activeClients = clients
        .where((c) => c.activeProgramName != null)
        .length;
    final totalClients = clients.length;

    return Row(
      children: [
        Expanded(
          child: _StatCard(
            title: 'Total Clients',
            value: '$totalClients',
            icon: Icons.people,
            color: Colors.blue,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _StatCard(
            title: 'Active Programs',
            value: '$activeClients',
            icon: Icons.fitness_center,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions(BuildContext context, String coachId, List<ClientSummary> clients) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.add)),
          title: const Text('Create New Program'),
          subtitle: const Text('Build a template or assign to a client'),
          onTap: () {
            showDialog(
              context: context,
              builder: (ctx) => _CreateProgramDialog(
                coachId: coachId,
                clients: clients,
              ),
            );
          },
        ),
        const Divider(),
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.library_books)),
          title: const Text('Exercise Library'),
          subtitle: const Text('Manage your custom exercises'),
          onTap: () {
            context.push('/coach/exercises');
          },
        ),
      ],
    );
  }
}

class _CreateProgramDialog extends StatefulWidget {
  final String coachId;
  final List<ClientSummary> clients;

  const _CreateProgramDialog({required this.coachId, required this.clients});

  @override
  State<_CreateProgramDialog> createState() => _CreateProgramDialogState();
}

class _CreateProgramDialogState extends State<_CreateProgramDialog> {
  final _nameController = TextEditingController();
  String? _selectedClientId;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Program'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Program Name'),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedClientId,
            hint: const Text('Select Client'),
            items: widget.clients
                .map(
                  (c) => DropdownMenuItem<String>(
                    value: c.user.id,
                    child: Text(c.user.fullName),
                  ),
                )
                .toList(),
            onChanged: (val) => setState(() => _selectedClientId = val),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _isLoading ? null : _submit,
          child: _isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Create'),
        ),
      ],
    );
  }

  Future<void> _submit() async {
    if (_nameController.text.isEmpty || _selectedClientId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a name and select a client.')),
      );
      return;
    }

    setState(() => _isLoading = true);
    final usecase = getIt<CreateProgram>();
    final result = await usecase(
      CreateProgramParams(
        coachId: widget.coachId,
        clientId: _selectedClientId!,
        name: _nameController.text.trim(),
        startDate: DateTime.now(),
      ),
    );

    if (!mounted) return;
    setState(() => _isLoading = false);

    result.fold(
      (failure) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: ${failure.message}')),
        );
      },
      (program) {
        Navigator.pop(context);
        context.go('/coach/program-builder/${program.id}');
      },
    );
  }
}


class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(icon, size: 32, color: color),
            const SizedBox(height: 8),
            Text(
              value,
              style: Theme.of(
                context,
              ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
