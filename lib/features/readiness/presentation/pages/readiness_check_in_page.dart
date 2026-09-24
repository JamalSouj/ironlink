import 'package:ascent/core/di/injection.dart';
import 'package:ascent/features/readiness/presentation/bloc/readiness_bloc.dart';
import 'package:ascent/features/readiness/presentation/bloc/readiness_event.dart';
import 'package:ascent/features/readiness/presentation/bloc/readiness_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ReadinessCheckInPage extends StatefulWidget {
  const ReadinessCheckInPage({super.key, required this.clientId});
  final String clientId;

  @override
  State<ReadinessCheckInPage> createState() => _ReadinessCheckInPageState();
}

class _ReadinessCheckInPageState extends State<ReadinessCheckInPage> {
  int sleepQuality = 3;
  int soreness = 3;
  int stress = 3;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ReadinessBloc>()..add(ReadinessEvent.started(clientId: widget.clientId)),
      child: BlocConsumer<ReadinessBloc, ReadinessState>(
        listener: (context, state) {
          if (state is ReadinessCompleted) {
            context.go('/client/today');
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Daily Check-in')),
            body: switch (state) {
              ReadinessInitial() ||
              ReadinessLoading() =>
                const Center(child: CircularProgressIndicator()),
              ReadinessError(:final failure) =>
                Center(child: Text('Error: ${failure.message}')),
              ReadinessCompleted() =>
                const Center(child: Text('Already submitted! Redirecting...')),
              ReadinessNeedsSubmission() => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'How are you feeling today?',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      _buildSlider('Sleep Quality (1=Terrible, 5=Great)', sleepQuality, (v) => setState(() => sleepQuality = v)),
                      const SizedBox(height: 16),
                      _buildSlider('Soreness (1=Extreme, 5=None)', soreness, (v) => setState(() => soreness = v)),
                      const SizedBox(height: 16),
                      _buildSlider('Stress (1=High, 5=Low)', stress, (v) => setState(() => stress = v)),
                      const SizedBox(height: 48),
                      ElevatedButton(
                        onPressed: () {
                          context.read<ReadinessBloc>().add(
                            ReadinessEvent.submitted(
                              clientId: widget.clientId,
                              sleepQuality: sleepQuality,
                              soreness: soreness,
                              stress: stress,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        child: const Text('Submit & Start Workout'),
                      ),
                    ],
                  ),
                ),
            },
          );
        },
      ),
    );
  }

  Widget _buildSlider(String label, int value, ValueChanged<int> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        Slider(
          value: value.toDouble(),
          min: 1,
          max: 5,
          divisions: 4,
          label: value.toString(),
          onChanged: (v) => onChanged(v.toInt()),
        ),
      ],
    );
  }
}
