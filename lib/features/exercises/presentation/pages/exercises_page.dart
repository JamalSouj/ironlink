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
    ));
  }
}
