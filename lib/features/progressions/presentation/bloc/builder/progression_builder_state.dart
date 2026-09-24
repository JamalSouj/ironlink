import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/progression_level.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progression_builder_state.freezed.dart';

@freezed
sealed class ProgressionBuilderState with _$ProgressionBuilderState {
  const factory ProgressionBuilderState.initial() = ProgressionBuilderInitial;
  const factory ProgressionBuilderState.loading() = ProgressionBuilderLoading;
  const factory ProgressionBuilderState.loaded({
    required String progressionId,
    required List<ProgressionLevel> levels,
  }) = ProgressionBuilderLoaded;
  const factory ProgressionBuilderState.error(Failure failure) =
      ProgressionBuilderError;
}
