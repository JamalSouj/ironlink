// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_today_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientTodayEvent {

 String get clientId;
/// Create a copy of ClientTodayEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientTodayEventCopyWith<ClientTodayEvent> get copyWith => _$ClientTodayEventCopyWithImpl<ClientTodayEvent>(this as ClientTodayEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayEvent&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientTodayEvent(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientTodayEventCopyWith<$Res>  {
  factory $ClientTodayEventCopyWith(ClientTodayEvent value, $Res Function(ClientTodayEvent) _then) = _$ClientTodayEventCopyWithImpl;
@useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientTodayEventCopyWithImpl<$Res>
    implements $ClientTodayEventCopyWith<$Res> {
  _$ClientTodayEventCopyWithImpl(this._self, this._then);

  final ClientTodayEvent _self;
  final $Res Function(ClientTodayEvent) _then;

/// Create a copy of ClientTodayEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ClientTodayStarted implements ClientTodayEvent {
  const ClientTodayStarted({required this.clientId});
  

@override final  String clientId;

/// Create a copy of ClientTodayEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientTodayStartedCopyWith<ClientTodayStarted> get copyWith => _$ClientTodayStartedCopyWithImpl<ClientTodayStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayStarted&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientTodayEvent.started(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientTodayStartedCopyWith<$Res> implements $ClientTodayEventCopyWith<$Res> {
  factory $ClientTodayStartedCopyWith(ClientTodayStarted value, $Res Function(ClientTodayStarted) _then) = _$ClientTodayStartedCopyWithImpl;
@override @useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientTodayStartedCopyWithImpl<$Res>
    implements $ClientTodayStartedCopyWith<$Res> {
  _$ClientTodayStartedCopyWithImpl(this._self, this._then);

  final ClientTodayStarted _self;
  final $Res Function(ClientTodayStarted) _then;

/// Create a copy of ClientTodayEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,}) {
  return _then(ClientTodayStarted(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
