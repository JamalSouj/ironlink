import 'package:ironlink/features/progressions/domain/entities/progression.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression_model.freezed.dart';
part 'progression_model.g.dart';

@freezed
abstract class ProgressionModel with _$ProgressionModel {
  const ProgressionModel._();

  const factory ProgressionModel({
    required String id,
    required String name,
    String? createdBy,
    DateTime? createdAt,
  }) = _ProgressionModel;

  factory ProgressionModel.fromJson(Map<String, dynamic> json) =>
      _$ProgressionModelFromJson(json);

  Progression toDomain() => Progression(
    id: id,
    name: name,
    createdBy: createdBy,
    createdAt: createdAt,
  );

  static ProgressionModel fromDomain(Progression entity) => ProgressionModel(
    id: entity.id,
    name: entity.name,
    createdBy: entity.createdBy,
    createdAt: entity.createdAt,
  );
}
