import 'package:freezed_annotation/freezed_annotation.dart';
part 'progression_builder_event.freezed.dart';

@freezed
class ProgressionBuilderEvent with _$ProgressionBuilderEvent {
  const factory ProgressionBuilderEvent.started(String progressionId) =
      ProgressionBuilderStarted;
  const factory ProgressionBuilderEvent.levelAdded({
    required String exerciseId,
    required Map<String, dynamic> unlockCriteria,
  }) = ProgressionBuilderLevelAdded;
  const factory ProgressionBuilderEvent.levelsReordered(
    int oldIndex,
    int newIndex,
  ) = ProgressionBuilderLevelsReordered;
}
