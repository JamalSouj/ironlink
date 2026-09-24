import 'package:freezed_annotation/freezed_annotation.dart';
part 'progressions_list_event.freezed.dart';

@freezed
class ProgressionsListEvent with _$ProgressionsListEvent {
  const factory ProgressionsListEvent.started() = ProgressionsListStarted;
}
