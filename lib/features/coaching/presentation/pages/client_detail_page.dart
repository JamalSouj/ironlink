import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/coaching/domain/entities/client_summary.dart';
import 'package:ironlink/features/progressions/domain/usecases/override_client_progression_level.dart';
import 'package:ironlink/features/progressions/domain/usecases/watch_client_progressions.dart';
import 'package:flutter/material.dart';

class ClientDetailPage extends StatelessWidget {
  const ClientDetailPage({super.key, required this.client});

  final ClientSummary client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(client.user.fullName)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Active Program: \${client.activeProgramName ?? "None"}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'Latest Readiness: \${client.latestReadinessScore ?? "N/A"}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Divider(height: 32),
            Text(
              'Assigned Progressions',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _ClientProgressionsView(clientId: client.user.id),
          ],
        ),
      ),
    );
  }
}

class _ClientProgressionsView extends StatelessWidget {
  const _ClientProgressionsView({required this.clientId});
  final String clientId;

  @override
  Widget build(BuildContext context) {
    final watchClientProgressions = getIt<WatchClientProgressions>();
    final overrideLevel = getIt<OverrideClientProgressionLevel>();

    return StreamBuilder(
      stream: watchClientProgressions(clientId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: \${snapshot.error}');
        }

        final either = snapshot.data;
        if (either == null) return const Text('No progressions found.');

        return either.fold((failure) => Text('Error: \${failure.message}'), (
          statuses,
        ) {
          if (statuses.isEmpty) return const Text('No progressions assigned.');
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: statuses.length,
            itemBuilder: (context, index) {
              final status = statuses[index];
              return Card(
                child: ListTile(
                  title: Text('Progression: \${status.progressionId}'),
                  subtitle: Text(
                    'Current Level: \${status.currentLevelId ?? "Not Started"}',
                  ),
                  trailing: ElevatedButton(
                    onPressed: () async {
                      // In a real app, this would show a dialog to pick the next level.
                      // Here we just mock the override action.
                      await overrideLevel(
                        OverrideClientProgressionLevelParams(
                          clientId: clientId,
                          progressionId: status.progressionId,
                          levelId: 'mock-next-level-id',
                        ),
                      );
                    },
                    child: const Text('Advance'),
                  ),
                ),
              );
            },
          );
        });
      },
    );
  }
}
