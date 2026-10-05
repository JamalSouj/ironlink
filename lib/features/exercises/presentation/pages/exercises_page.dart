import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/features/exercises/data/datasources/supabase_exercise_remote_datasource.dart';
import 'package:ironlink/features/exercises/data/repositories/exercise_repository_impl.dart';
import 'package:ironlink/features/exercises/domain/usecases/get_exercises.dart';
import 'package:ironlink/features/exercises/presentation/bloc/exercise_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ExercisesPage extends StatelessWidget {
  const ExercisesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final remoteDataSource = SupabaseExerciseRemoteDataSource(Supabase.instance.client);
        final repository = ExerciseRepositoryImpl(remoteDataSource: remoteDataSource);
        final getExercises = GetExercises(repository);
        return ExerciseBloc(getExercises: getExercises)..add(FetchExercisesEvent());
      },
      child: Scaffold(
        appBar: AppBar(title: const Text('Exercises')),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showAddExerciseDialog(context),
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ExerciseBloc, ExerciseState>(
          builder: (context, state) {
            if (state is ExerciseLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ExerciseLoaded) {
              if (state.exercises.isEmpty) {
                return const Center(child: Text('No exercises found.'));
              }
              return ListView.builder(
                itemCount: state.exercises.length,
                itemBuilder: (context, index) {
                  final exercise = state.exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text(exercise.category),
                  );
                },
              );
            } else if (state is ExerciseError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Initial State'));
          },
        ),
      ),
    );
  }

  void _showAddExerciseDialog(BuildContext context) {
    final nameController = TextEditingController();
    final categoryController = TextEditingController();
    final demoUrlController = TextEditingController();
    final bloc = context.read<ExerciseBloc>();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Exercise'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Exercise Name'),
                ),
                TextField(
                  controller: categoryController,
                  decoration: const InputDecoration(labelText: 'Category (e.g., Chest, Legs)'),
                ),
                TextField(
                  controller: demoUrlController,
                  decoration: const InputDecoration(labelText: 'Demo Video URL (optional)'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.trim().isEmpty || categoryController.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Name and category are required')),
                  );
                  return;
                }
                final newExercise = Exercise(
                  id: '', // Supabase will generate this if omitted, or we can use Uuid() but typically Supabase generates uuid on DB. Wait, Freezed id is required. Let's pass empty and let remote data source handle it, or we should generate a uuid.
                  name: nameController.text.trim(),
                  category: categoryController.text.trim(),
                  demoVideoUrl: demoUrlController.text.trim().isEmpty ? null : demoUrlController.text.trim(),
                );
                bloc.add(AddExerciseEvent(newExercise));
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
