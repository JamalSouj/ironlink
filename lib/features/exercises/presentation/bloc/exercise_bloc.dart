import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';
import 'package:ironlink/features/exercises/domain/usecases/get_exercises.dart';

import 'package:ironlink/features/exercises/domain/usecases/add_exercise.dart';

abstract class ExerciseEvent {}

class FetchExercisesEvent extends ExerciseEvent {}

class AddExerciseEvent extends ExerciseEvent {
  final Exercise exercise;
  AddExerciseEvent(this.exercise);
}

abstract class ExerciseState {}

class ExerciseInitial extends ExerciseState {}

class ExerciseLoading extends ExerciseState {}

class ExerciseLoaded extends ExerciseState {
  final List<Exercise> exercises;
  ExerciseLoaded(this.exercises);
}

class ExerciseError extends ExerciseState {
  final String message;
  ExerciseError(this.message);
}

@injectable
class ExerciseBloc extends Bloc<ExerciseEvent, ExerciseState> {
  final GetExercises getExercises;
  final AddExercise addExercise;

  ExerciseBloc({required this.getExercises, required this.addExercise}) : super(ExerciseInitial()) {
    on<FetchExercisesEvent>((event, emit) async {
      emit(ExerciseLoading());
      final result = await getExercises();
      result.fold(
        (failure) => emit(ExerciseError(failure.message)),
        (exercises) => emit(ExerciseLoaded(exercises)),
      );
    });

    on<AddExerciseEvent>((event, emit) async {
      final currentState = state;
      // We don't want to show a full-screen loading indicator for adding, 
      // but let's just do a simple approach for now, or keep the old state.
      // If we keep the old state, we can just emit it again or wait for the result.
      final result = await addExercise(event.exercise);
      result.fold(
        (failure) => emit(ExerciseError(failure.message)),
        (newExercise) {
          if (currentState is ExerciseLoaded) {
            emit(ExerciseLoaded([...currentState.exercises, newExercise]..sort((a, b) => a.name.compareTo(b.name))));
          } else {
            add(FetchExercisesEvent());
          }
        },
      );
    });
  }
}
