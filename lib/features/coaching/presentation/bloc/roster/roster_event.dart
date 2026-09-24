import 'package:freezed_annotation/freezed_annotation.dart';
part 'roster_event.freezed.dart';

@freezed
class RosterEvent with _$RosterEvent {
  const factory RosterEvent.started() = RosterStarted;
}
