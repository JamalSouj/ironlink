import 'package:freezed_annotation/freezed_annotation.dart';
part 'invite_event.freezed.dart';

@freezed
class InviteEvent with _$InviteEvent {
  const factory InviteEvent.generatePressed() = InviteGeneratePressed;
}
