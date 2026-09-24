// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_progressions_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientProgressionsEvent {

 String get clientId;
/// Create a copy of ClientProgressionsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProgressionsEventCopyWith<ClientProgressionsEvent> get copyWith => _$ClientProgressionsEventCopyWithImpl<ClientProgressionsEvent>(this as ClientProgressionsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsEvent&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientProgressionsEvent(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientProgressionsEventCopyWith<$Res>  {
  factory $ClientProgressionsEventCopyWith(ClientProgressionsEvent value, $Res Function(ClientProgressionsEvent) _then) = _$ClientProgressionsEventCopyWithImpl;
@useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientProgressionsEventCopyWithImpl<$Res>
    implements $ClientProgressionsEventCopyWith<$Res> {
  _$ClientProgressionsEventCopyWithImpl(this._self, this._then);

  final ClientProgressionsEvent _self;
  final $Res Function(ClientProgressionsEvent) _then;

/// Create a copy of ClientProgressionsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ClientProgressionsStarted implements ClientProgressionsEvent {
  const ClientProgressionsStarted({required this.clientId});
  

@override final  String clientId;

/// Create a copy of ClientProgressionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProgressionsStartedCopyWith<ClientProgressionsStarted> get copyWith => _$ClientProgressionsStartedCopyWithImpl<ClientProgressionsStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsStarted&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ClientProgressionsEvent.started(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ClientProgressionsStartedCopyWith<$Res> implements $ClientProgressionsEventCopyWith<$Res> {
  factory $ClientProgressionsStartedCopyWith(ClientProgressionsStarted value, $Res Function(ClientProgressionsStarted) _then) = _$ClientProgressionsStartedCopyWithImpl;
@override @useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ClientProgressionsStartedCopyWithImpl<$Res>
    implements $ClientProgressionsStartedCopyWith<$Res> {
  _$ClientProgressionsStartedCopyWithImpl(this._self, this._then);

  final ClientProgressionsStarted _self;
  final $Res Function(ClientProgressionsStarted) _then;

/// Create a copy of ClientProgressionsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,}) {
  return _then(ClientProgressionsStarted(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
