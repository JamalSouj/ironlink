import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/progressions/domain/entities/progression.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'progressions_list_state.freezed.dart';

@freezed
class ProgressionsListState with _$ProgressionsListState {
  const factory ProgressionsListState.initial() = _Initial;
  const factory ProgressionsListState.loading() = _Loading;
  const factory ProgressionsListState.loaded(List<Progression> progressions) =
      _Loaded;
  const factory ProgressionsListState.error(Failure failure) = _Error;
}
