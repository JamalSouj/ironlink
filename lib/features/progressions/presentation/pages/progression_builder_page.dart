import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/progressions/presentation/bloc/builder/progression_builder_bloc.dart';
import 'package:ironlink/features/progressions/presentation/bloc/builder/progression_builder_event.dart';
import 'package:ironlink/features/progressions/presentation/bloc/builder/progression_builder_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ProgressionBuilderPage extends StatelessWidget {
  const ProgressionBuilderPage({super.key, required this.progressionId});

  final String progressionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProgressionBuilderBloc>()
            ..add(ProgressionBuilderEvent.started(progressionId)),
      child: const _ProgressionBuilderView(),
    );
  }
}

class _ProgressionBuilderView extends StatelessWidget {
  const _ProgressionBuilderView();

  void _showAddLevelModal(BuildContext context, ProgressionBuilderBloc bloc) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => LevelUnlockCriteriaForm(
        onSubmit: (exerciseId, criteria) {
          bloc.add(
            ProgressionBuilderEvent.levelAdded(
              exerciseId: exerciseId,
              unlockCriteria: criteria,
            ),
          );
          context.pop();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Progression Builder')),
      body: BlocBuilder<ProgressionBuilderBloc, ProgressionBuilderState>(
        builder: (context, state) {
          return switch (state) {
            ProgressionBuilderInitial() ||
            ProgressionBuilderLoading() =>
              const Center(child: CircularProgressIndicator()),
            ProgressionBuilderError(:final failure) =>
              Center(child: Text('Error: ${failure.message}')),
            ProgressionBuilderLoaded(:final levels) => () {
                if (levels.isEmpty) {
                  return const Center(child: Text('No levels yet. Add one!'));
                }
                return ReorderableListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: levels.length,
                  onReorder: (oldIndex, newIndex) {
                    context.read<ProgressionBuilderBloc>().add(
                      ProgressionBuilderEvent.levelsReordered(oldIndex, newIndex),
                    );
                  },
                  itemBuilder: (context, index) {
                    final level = levels[index];
                    return Card(
                      key: ValueKey(level.id),
                      margin: const EdgeInsets.only(bottom: 8.0),
                      child: ListTile(
                        leading: CircleAvatar(child: Text('${index + 1}')),
                        title: Text(
                          'Exercise: ${level.exerciseId}',
                        ), // In reality, we'd fetch the Exercise name
                        subtitle: Text('Criteria: ${level.unlockCriteria}'),
                        trailing: const Icon(Icons.drag_handle),
                      ),
                    );
                  },
                );
              }(),
          };
        },
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton.extended(
            onPressed: () => _showAddLevelModal(
              context,
              context.read<ProgressionBuilderBloc>(),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add Level'),
          );
        },
      ),
    );
  }
}

class LevelUnlockCriteriaForm extends StatefulWidget {
  const LevelUnlockCriteriaForm({super.key, required this.onSubmit});

  final void Function(String exerciseId, Map<String, dynamic> criteria)
  onSubmit;

  @override
  State<LevelUnlockCriteriaForm> createState() =>
      _LevelUnlockCriteriaFormState();
}

class _LevelUnlockCriteriaFormState extends State<LevelUnlockCriteriaForm> {
  final _formKey = GlobalKey<FormState>();
  final _exerciseController = TextEditingController();
  final _setsController = TextEditingController();
  final _repsController = TextEditingController();
  final _rpeController = TextEditingController();
  final _sessionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16.0,
        right: 16.0,
        top: 24.0,
      ),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Add Progression Level',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _exerciseController,
              decoration: const InputDecoration(
                labelText: 'Exercise ID (mock)',
              ),
              validator: (v) => v!.isEmpty ? 'Required' : null,
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _setsController,
                    decoration: const InputDecoration(labelText: 'Sets'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _repsController,
                    decoration: const InputDecoration(labelText: 'Reps'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _rpeController,
                    decoration: const InputDecoration(labelText: 'RPE Ceiling'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _sessionsController,
                    decoration: const InputDecoration(
                      labelText: 'Consecutive Sessions',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final criteria = {
                    if (_setsController.text.isNotEmpty)
                      'sets': int.tryParse(_setsController.text),
                    if (_repsController.text.isNotEmpty)
                      'reps': int.tryParse(_repsController.text),
                    if (_rpeController.text.isNotEmpty)
                      'rpe_ceiling': double.tryParse(_rpeController.text),
                    if (_sessionsController.text.isNotEmpty)
                      'consecutive_sessions': int.tryParse(
                        _sessionsController.text,
                      ),
                  };
                  widget.onSubmit(_exerciseController.text, criteria);
                }
              },
              child: const Text('Save Level'),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
