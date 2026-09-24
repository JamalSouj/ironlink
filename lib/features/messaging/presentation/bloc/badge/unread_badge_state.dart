import 'package:freezed_annotation/freezed_annotation.dart';
part 'unread_badge_state.freezed.dart';

@freezed
sealed class UnreadBadgeState with _$UnreadBadgeState {
  const factory UnreadBadgeState({@Default(0) int count}) = _UnreadBadgeState;
}
