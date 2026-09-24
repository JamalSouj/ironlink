import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_today_event.freezed.dart';

@freezed
sealed class ClientTodayEvent with _$ClientTodayEvent {
  const factory ClientTodayEvent.started({required String clientId}) =
      ClientTodayStarted;
}
