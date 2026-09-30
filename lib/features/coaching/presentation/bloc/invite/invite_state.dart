import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';

part 'invite_state.freezed.dart';

@freezed
sealed class InviteState with _$InviteState {
  const factory InviteState.initial() = InviteInitial;
  const factory InviteState.generating() = InviteGenerating;
  const factory InviteState.generated(String inviteCode) = InviteGenerated;
  const factory InviteState.error(Failure failure) = InviteError;
}
