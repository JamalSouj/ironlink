import 'package:ascent/features/programs/domain/entities/program.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed
abstract class ProgramModel with _$ProgramModel {
  const ProgramModel._();

  const factory ProgramModel({
    required String id,
    required String coachId,
    required String clientId,
    required String name,
    required DateTime startDate,
    DateTime? endDate,
    required DateTime createdAt,
  }) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);

  Program toDomain() => Program(
    id: id,
    coachId: coachId,
    clientId: clientId,
    name: name,
    startDate: startDate,
    endDate: endDate,
    createdAt: createdAt,
  );

  static ProgramModel fromDomain(Program entity) => ProgramModel(
    id: entity.id,
    coachId: entity.coachId,
    clientId: entity.clientId,
    name: entity.name,
    startDate: entity.startDate,
    endDate: entity.endDate,
    createdAt: entity.createdAt,
  );
}
