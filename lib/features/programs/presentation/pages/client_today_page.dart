import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/programs/presentation/bloc/today/client_today_bloc.dart';
import 'package:ironlink/features/programs/presentation/bloc/today/client_today_event.dart';
import 'package:ironlink/features/programs/presentation/bloc/today/client_today_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ClientTodayPage extends StatelessWidget {
  const ClientTodayPage({super.key, required this.clientId});
  final String clientId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ClientTodayBloc>()..add(ClientTodayEvent.started(clientId: clientId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Today')),
        body: BlocBuilder<ClientTodayBloc, ClientTodayState>(
          builder: (context, state) {
            return switch (state) {
              ClientTodayInitial() ||
              ClientTodayLoading() =>
                const Center(child: CircularProgressIndicator()),
              ClientTodayError(:final failure) =>
                Center(child: Text('Error: ${failure.message}')),
              ClientTodayLoaded(:final session) => () {
                  if (session == null) {
                    return const Center(child: Text('Rest Day! No sessions scheduled for today.'));
                  }

                  if (session.status == 'completed') {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.check_circle, color: Colors.green, size: 64),
                          SizedBox(height: 16),
                          Text('Workout Completed!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    );
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text('Ready to crush it?', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text('\${session.setLogs.length} sets prescribed.'),
                        const SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to active workout logging
                            context.push('/client/workout/\${session.id}', extra: session);
                          },
                          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60)),
                          child: const Text('Start Workout', style: TextStyle(fontSize: 18)),
                        ),
                      ],
                    ),
                  );
                }(),
            };
          },
        ),
      ),
    );
  }
}
