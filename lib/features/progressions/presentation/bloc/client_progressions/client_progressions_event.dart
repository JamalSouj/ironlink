import 'package:freezed_annotation/freezed_annotation.dart';

part 'client_progressions_event.freezed.dart';

@freezed
sealed class ClientProgressionsEvent with _$ClientProgressionsEvent {
  const factory ClientProgressionsEvent.started({required String clientId}) =
      ClientProgressionsStarted;
}
