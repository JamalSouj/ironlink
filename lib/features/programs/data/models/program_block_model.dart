import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_block_model.freezed.dart';
part 'program_block_model.g.dart';

@freezed
abstract class ProgramBlockModel with _$ProgramBlockModel {
  const ProgramBlockModel._();

  const factory ProgramBlockModel({
    required String id,
    required String programId,
    required String name,
    required int blockOrder,
    String? focus,
  }) = _ProgramBlockModel;

  factory ProgramBlockModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramBlockModelFromJson(json);

  ProgramBlock toDomain() => ProgramBlock(
    id: id,
    programId: programId,
    name: name,
    blockOrder: blockOrder,
    focus: focus,
  );

  static ProgramBlockModel fromDomain(ProgramBlock entity) => ProgramBlockModel(
    id: entity.id,
    programId: entity.programId,
    name: entity.name,
    blockOrder: entity.blockOrder,
    focus: entity.focus,
  );
}
