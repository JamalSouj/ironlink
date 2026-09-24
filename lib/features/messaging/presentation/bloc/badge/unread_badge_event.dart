import 'package:freezed_annotation/freezed_annotation.dart';
part 'unread_badge_event.freezed.dart';

@freezed
sealed class UnreadBadgeEvent with _$UnreadBadgeEvent {
  const factory UnreadBadgeEvent.started({required String currentUserId}) =
      UnreadBadgeStarted;
}
