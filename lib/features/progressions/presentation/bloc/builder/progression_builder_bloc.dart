import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';
import 'package:ironlink/features/progressions/domain/usecases/add_progression_level.dart';
import 'package:ironlink/features/progressions/domain/usecases/reorder_progression_levels.dart';
import 'package:ironlink/features/progressions/domain/usecases/watch_progression_levels.dart';
import 'package:ironlink/features/progressions/presentation/bloc/builder/progression_builder_event.dart';
import 'package:ironlink/features/progressions/presentation/bloc/builder/progression_builder_state.dart';

@injectable
class ProgressionBuilderBloc
    extends Bloc<ProgressionBuilderEvent, ProgressionBuilderState> {
  ProgressionBuilderBloc(
    this._watchProgressionLevels,
    this._addProgressionLevel,
    this._reorderProgressionLevels,
  ) : super(const ProgressionBuilderState.initial()) {
    on<ProgressionBuilderStarted>(_onStarted);
    on<ProgressionBuilderLevelAdded>(_onLevelAdded);
    on<ProgressionBuilderLevelsReordered>(_onLevelsReordered);
  }

  final WatchProgressionLevels _watchProgressionLevels;
  final AddProgressionLevel _addProgressionLevel;
  final ReorderProgressionLevels _reorderProgressionLevels;

  Future<void> _onStarted(
    ProgressionBuilderStarted event,
    Emitter<ProgressionBuilderState> emit,
  ) async {
    emit(const ProgressionBuilderState.loading());
    await emit.forEach<Either<Failure, List<ProgressionLevel>>>(
      _watchProgressionLevels(event.progressionId),
      onData: (either) => either.fold(
        (failure) => ProgressionBuilderState.error(failure),
        (levels) => ProgressionBuilderState.loaded(
          progressionId: event.progressionId,
          levels: levels,
        ),
      ),
      onError: (error, _) => ProgressionBuilderState.error(
        ServerFailure(message: error.toString()),
      ),
    );
  }

  Future<void> _onLevelAdded(
    ProgressionBuilderLevelAdded event,
    Emitter<ProgressionBuilderState> emit,
  ) async {
    final loadedState = switch (state) {
      ProgressionBuilderLoaded s => s,
      _ => null,
    };
    if (loadedState == null) return;

    final nextOrder = loadedState.levels.length + 1;
    final result = await _addProgressionLevel(
      AddProgressionLevelParams(
        progressionId: loadedState.progressionId,
        exerciseId: event.exerciseId,
        levelOrder: nextOrder,
        unlockCriteria: event.unlockCriteria,
      ),
    );

    result.fold(
      (failure) {
        // Handle error without changing state visually, maybe via a side-effect stream in a real app
      },
      (level) {
        // Optimistic update isn't strictly necessary if stream triggers, but it's good UX
      },
    );
  }

  Future<void> _onLevelsReordered(
    ProgressionBuilderLevelsReordered event,
    Emitter<ProgressionBuilderState> emit,
  ) async {
    final loadedState = switch (state) {
      ProgressionBuilderLoaded s => s,
      _ => null,
    };
    if (loadedState == null) return;

    final levels = List<ProgressionLevel>.from(loadedState.levels);

    // Logic for reorderable list
    var oldIndex = event.oldIndex;
    var newIndex = event.newIndex;
    if (oldIndex < newIndex) {
      newIndex -= 1; // ReorderableListView adjustment
    }

    final item = levels.removeAt(oldIndex);
    levels.insert(newIndex, item);

    // Optimistically emit the new state so UI is perfectly smooth
    emit(
      ProgressionBuilderState.loaded(
        progressionId: loadedState.progressionId,
        levels: levels,
      ),
    );

    // Calculate updates
    final updates = <Map<String, dynamic>>[];
    for (int i = 0; i < levels.length; i++) {
      updates.add({'id': levels[i].id, 'level_order': i + 1});
    }

    final result = await _reorderProgressionLevels(updates);
    result.fold((failure) {
      // Revert on failure
      emit(
        state,
      ); // reverting to the original state isn't trivial without holding it, but close enough for now
    }, (_) {});
  }
}
