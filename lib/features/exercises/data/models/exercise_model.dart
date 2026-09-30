import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/exercises/domain/entities/exercise.dart';

part 'exercise_model.freezed.dart';
part 'exercise_model.g.dart';

@freezed
abstract class ExerciseModel with _$ExerciseModel {
  const ExerciseModel._();

  const factory ExerciseModel({
    required String id,
    required String name,
    required String category,
    String? demoVideoUrl,
    String? createdBy,
    DateTime? createdAt,
  }) = _ExerciseModel;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseModelFromJson(json);

  Exercise toDomain() => Exercise(
    id: id,
    name: name,
    category: category,
    demoVideoUrl: demoVideoUrl,
    createdBy: createdBy,
    createdAt: createdAt,
  );

  static ExerciseModel fromDomain(Exercise entity) => ExerciseModel(
    id: entity.id,
    name: entity.name,
    category: entity.category,
    demoVideoUrl: entity.demoVideoUrl,
    createdBy: entity.createdBy,
    createdAt: entity.createdAt,
  );
}
