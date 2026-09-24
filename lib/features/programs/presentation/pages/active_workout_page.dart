import 'package:ascent/core/di/injection.dart';
import 'package:ascent/features/programs/domain/entities/set_log.dart';
import 'package:ascent/features/programs/domain/entities/workout_session.dart';
import 'package:ascent/features/programs/presentation/bloc/workout/workout_logging_bloc.dart';
import 'package:ascent/features/programs/presentation/bloc/workout/workout_logging_event.dart';
import 'package:ascent/features/programs/presentation/bloc/workout/workout_logging_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/uuid.dart';

class ActiveWorkoutPage extends StatefulWidget {
  const ActiveWorkoutPage({super.key, required this.session});
  final WorkoutSession session;

  @override
  State<ActiveWorkoutPage> createState() => _ActiveWorkoutPageState();
}

class _ActiveWorkoutPageState extends State<ActiveWorkoutPage> {
  int _currentSetIndex = 0;
  final TextEditingController _repsController = TextEditingController();
  final TextEditingController _loadController = TextEditingController();
  final TextEditingController _rpeController = TextEditingController();

  @override
  void dispose() {
    _repsController.dispose();
    _loadController.dispose();
    _rpeController.dispose();
    super.dispose();
  }

  void _submitSet(BuildContext context) {
    if (_currentSetIndex >= widget.session.setLogs.length) return;

    final prescribed = widget.session.setLogs[_currentSetIndex];
    final reps = int.tryParse(_repsController.text) ?? prescribed.prescribedReps ?? 0;
    final load = double.tryParse(_loadController.text) ?? prescribed.prescribedLoadKg;
    final rpe = int.tryParse(_rpeController.text)?.toDouble();

    final actualSetLog = SetLog(
      id: const Uuid().v4(),
      workoutSessionId: widget.session.id,
      exerciseId: prescribed.exerciseId,
      setOrder: prescribed.setOrder,
      prescribedReps: prescribed.prescribedReps,
      prescribedLoadKg: prescribed.prescribedLoadKg,
      prescribedPct1Rm: prescribed.prescribedPct1Rm,
      tempo: prescribed.tempo,
      actualReps: reps,
      actualLoadKg: load,
      actualRpe: rpe,
    );

    context.read<WorkoutLoggingBloc>().add(WorkoutLoggingEvent.setLogged(setLog: actualSetLog));

    if (_currentSetIndex < widget.session.setLogs.length - 1) {
      setState(() {
        _currentSetIndex++;
        _repsController.clear();
        _loadController.clear();
        _rpeController.clear();
      });
    } else {
      // Last set done, prompt for session completion
      setState(() {
        _currentSetIndex++;
      });
    }
  }

  void _finishSession(BuildContext context) {
    // Show dialog for Session RPE and Duration
    int sessionRpe = 7;
    int duration = 60;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Session Complete!'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Great job! How was the session overall?'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Session RPE (1-10)'),
              keyboardType: TextInputType.number,
              onChanged: (v) => sessionRpe = int.tryParse(v) ?? 7,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Duration (minutes)'),
              keyboardType: TextInputType.number,
              onChanged: (v) => duration = int.tryParse(v) ?? 60,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<WorkoutLoggingBloc>().add(
                    WorkoutLoggingEvent.sessionCompleted(
                      sessionId: widget.session.id,
                      sessionRpe: sessionRpe,
                      durationMinutes: duration,
                    ),
                  );
            },
            child: const Text('Finish'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WorkoutLoggingBloc>()..add(WorkoutLoggingEvent.started(sessionId: widget.session.id)),
      child: BlocConsumer<WorkoutLoggingBloc, WorkoutLoggingState>(
        listener: (context, state) {
          switch (state) {
            case WorkoutLoggingCompleted(:final unlockedLevels):
              if (unlockedLevels.isNotEmpty) {
                // Show level up moment!
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('🎉 LEVEL UP! You unlocked a new progression level!')),
                );
              }
              context.pop(); // Go back to Today
            case WorkoutLoggingError(:final failure):
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${failure.message}')));
            default:
              break;
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('Active Workout')),
            body: switch (state) {
              WorkoutLoggingSubmitting() => const Center(child: CircularProgressIndicator()),
              _ => () {
                if (_currentSetIndex >= widget.session.setLogs.length) {
                  return Center(
                    child: ElevatedButton(
                      onPressed: () => _finishSession(context),
                      child: const Text('Finish Session'),
                    ),
                  );
                }

                final currentSet = widget.session.setLogs[_currentSetIndex];

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Set ${_currentSetIndex + 1} of ${widget.session.setLogs.length}',
                        style: const TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Exercise ID: ${currentSet.exerciseId}', // TODO: Resolve name from local exercises
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Text("Prescribed: ${currentSet.prescribedReps ?? '-'} reps @ ${currentSet.prescribedLoadKg ?? '-'} kg"),
                      const SizedBox(height: 32),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _loadController,
                              decoration: const InputDecoration(labelText: 'Load (kg)', border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _repsController,
                              decoration: const InputDecoration(labelText: 'Reps', border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: TextField(
                              controller: _rpeController,
                              decoration: const InputDecoration(labelText: 'RPE', border: OutlineInputBorder()),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () => _submitSet(context),
                        style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 60)),
                        child: const Text('Log Set & Continue', style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                );
              }(),
            },
          );
        },
      ),
    );
  }
}
