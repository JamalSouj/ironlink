import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:ironlink/features/programs/presentation/bloc/builder/program_builder_bloc.dart';
import 'package:ironlink/features/programs/presentation/bloc/builder/program_builder_event.dart';
import 'package:ironlink/features/programs/presentation/bloc/builder/program_builder_state.dart';

class ProgramBuilderPage extends StatelessWidget {
  const ProgramBuilderPage({super.key, required this.programId});

  final String programId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProgramBuilderBloc>()
            ..add(ProgramBuilderEvent.started(programId: programId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Program Builder'),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    // Quick add block
                    context.read<ProgramBuilderBloc>().add(
                      const ProgramBuilderEvent.addBlock(
                        name: 'New Block',
                        blockOrder: 1,
                        focus: 'hypertrophy',
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<ProgramBuilderBloc, ProgramBuilderState>(
          builder: (context, state) {
            return switch (state) {
              ProgramBuilderInitial() || ProgramBuilderLoading() =>
                const Center(child: CircularProgressIndicator()),
              ProgramBuilderError(:final failure) => Center(
                child: Text('Error: ${failure.message}'),
              ),
              ProgramBuilderLoaded(:final blocks) => () {
                if (blocks.isEmpty) {
                  return const Center(child: Text('No blocks found. Add one!'));
                }
                return ListView.builder(
                  itemCount: blocks.length,
                  itemBuilder: (context, index) {
                    final block = blocks[index];
                    return _ProgramBlockCard(block: block);
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

class _ProgramBlockCard extends StatelessWidget {
  const _ProgramBlockCard({required this.block});
  final ProgramBlock block;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTile(
            title: Text(
              block.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Focus: \${block.focus ?? "None"}'),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: () {
                // duplicate week logic placeholder
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Duplicate week tapped')),
                );
              },
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Sessions Grid (Placeholder)'),
          ),
        ],
      ),
    );
  }
}
