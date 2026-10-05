import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/fatigue/presentation/bloc/fatigue_dashboard_bloc.dart';
import 'package:ironlink/features/fatigue/presentation/bloc/fatigue_dashboard_event.dart';
import 'package:ironlink/features/fatigue/presentation/bloc/fatigue_dashboard_state.dart';
import 'package:ironlink/features/fatigue/presentation/widgets/fatigue_chart.dart';

class FatigueDashboardPage extends StatelessWidget {
  const FatigueDashboardPage({
    super.key,
    required this.clientId,
    required this.clientName,
    this.hideAppBar = false,
  });

  final String clientId;
  final String clientName;
  final bool hideAppBar;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FatigueDashboardBloc>()
            ..add(FatigueDashboardEvent.started(clientId: clientId)),
      child: Scaffold(
        appBar: hideAppBar ? null : AppBar(title: Text('$clientName - Fatigue Dashboard')),
        body: BlocBuilder<FatigueDashboardBloc, FatigueDashboardState>(
          builder: (context, state) {
            return switch (state) {
              FatigueDashboardInitial() || FatigueDashboardLoading() =>
                const Center(child: CircularProgressIndicator()),
              FatigueDashboardError(:final failure) => Center(
                child: Text('Error: ${failure.message}'),
              ),
              FatigueDashboardLoaded(:final data, :final isAtRisk) => Column(
                children: [
                  if (isAtRisk)
                    Container(
                      color: Colors.redAccent,
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      child: const Text(
                        'WARNING: Client is in the ACWR Danger Zone (> 1.5). Consider a deload week.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  Expanded(flex: 3, child: FatigueChart(data: data)),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Daily Readiness Logs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        // Show reverse chronological
                        final point = data[data.length - 1 - index];
                        final hasReadiness =
                            point.sleepQuality != null ||
                            point.soreness != null ||
                            point.stress != null;
                        return ListTile(
                          title: Text('${point.date.month}/${point.date.day}'),
                          subtitle: hasReadiness
                              ? Text(
                                  'Sleep: ${point.sleepQuality}/5 | Soreness: ${point.soreness}/5 | Stress: ${point.stress}/5',
                                )
                              : const Text('No readiness logged'),
                          trailing: Text(
                            'ACWR: ${point.acwr.toStringAsFixed(2)}',
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            };
          },
        ),
      ),
    );
  }
}
