import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression_level_model.freezed.dart';
part 'progression_level_model.g.dart';

@freezed
abstract class ProgressionLevelModel with _$ProgressionLevelModel {
  const ProgressionLevelModel._();

  const factory ProgressionLevelModel({
    required String id,
    required String progressionId,
    required String exerciseId,
    required int levelOrder,
    required Map<String, dynamic> unlockCriteria,
  }) = _ProgressionLevelModel;

  factory ProgressionLevelModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressionLevelModelFromJson(json);

  ProgressionLevel toDomain() => ProgressionLevel(
    id: id,
    progressionId: progressionId,
    exerciseId: exerciseId,
    levelOrder: levelOrder,
    unlockCriteria: unlockCriteria,
  );

  static ProgressionLevelModel fromDomain(ProgressionLevel entity) =>
      ProgressionLevelModel(
        id: entity.id,
        progressionId: entity.progressionId,
        exerciseId: entity.exerciseId,
        levelOrder: entity.levelOrder,
        unlockCriteria: entity.unlockCriteria,
      );
}
