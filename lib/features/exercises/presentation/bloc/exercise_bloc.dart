import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';
import 'package:ironlink/features/exercises/domain/usecases/get_exercises.dart';

abstract class ExerciseEvent {}

class FetchExercisesEvent extends ExerciseEvent {}

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

  ExerciseBloc({required this.getExercises}) : super(ExerciseInitial()) {
    on<FetchExercisesEvent>((event, emit) async {
      emit(ExerciseLoading());
      final result = await getExercises();
      result.fold(
        (failure) => emit(ExerciseError(failure.message)),
        (exercises) => emit(ExerciseLoaded(exercises)),
      );
    });
  }
}
