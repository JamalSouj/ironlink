import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/programs/domain/entities/program_block.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_builder_state.freezed.dart';

@freezed
sealed class ProgramBuilderState with _$ProgramBuilderState {
  const factory ProgramBuilderState.initial() = ProgramBuilderInitial;
  const factory ProgramBuilderState.loading() = ProgramBuilderLoading;
  const factory ProgramBuilderState.loaded({
    required List<ProgramBlock> blocks,
  }) = ProgramBuilderLoaded;
  const factory ProgramBuilderState.error({required Failure failure}) =
      ProgramBuilderError;
}
