import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/progressions/presentation/bloc/client_progressions/client_progressions_bloc.dart';
import 'package:ironlink/features/progressions/presentation/bloc/client_progressions/client_progressions_event.dart';
import 'package:ironlink/features/progressions/presentation/bloc/client_progressions/client_progressions_state.dart';

class ClientProgressionsPage extends StatelessWidget {
  const ClientProgressionsPage({super.key, required this.clientId});
  final String clientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientProgressionsBloc>()..add(ClientProgressionsEvent.started(clientId: clientId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('My Progressions')),
        body: BlocBuilder<ClientProgressionsBloc, ClientProgressionsState>(
          builder: (context, state) {
            return switch (state) {
              ClientProgressionsInitial() ||
              ClientProgressionsLoading() =>
                const Center(child: CircularProgressIndicator()),
              ClientProgressionsError(:final failure) =>
                Center(child: Text('Error: ${failure.message}')),
              ClientProgressionsLoaded(:final progressions) => () {
                  if (progressions.isEmpty) {
                    return const Center(child: Text('No active progressions.'));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16.0),
                    itemCount: progressions.length,
                    itemBuilder: (context, index) {
                      final prog = progressions[index];
                      return Card(
                        child: ListTile(
                          title: Text(
                            prog.progressionId,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('ID: ${prog.id}'),
                          trailing: const Icon(Icons.arrow_forward_ios),
                          onTap: () {
                            // View details
                          },
                        ),
                      );
                    },
                  );
                }(),
            };
          },
        ),
      ),
    );
  }
}
