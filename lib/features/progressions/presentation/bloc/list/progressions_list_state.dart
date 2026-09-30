import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/progressions/domain/entities/progression.dart';

part 'progressions_list_state.freezed.dart';

@freezed
class ProgressionsListState with _$ProgressionsListState {
  const factory ProgressionsListState.initial() = _Initial;
  const factory ProgressionsListState.loading() = _Loading;
  const factory ProgressionsListState.loaded(List<Progression> progressions) =
      _Loaded;
  const factory ProgressionsListState.error(Failure failure) = _Error;
}
