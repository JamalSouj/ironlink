// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'readiness_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadinessEvent {

 String get clientId;
/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessEventCopyWith<ReadinessEvent> get copyWith => _$ReadinessEventCopyWithImpl<ReadinessEvent>(this as ReadinessEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessEvent&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ReadinessEvent(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ReadinessEventCopyWith<$Res>  {
  factory $ReadinessEventCopyWith(ReadinessEvent value, $Res Function(ReadinessEvent) _then) = _$ReadinessEventCopyWithImpl;
@useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ReadinessEventCopyWithImpl<$Res>
    implements $ReadinessEventCopyWith<$Res> {
  _$ReadinessEventCopyWithImpl(this._self, this._then);

  final ReadinessEvent _self;
  final $Res Function(ReadinessEvent) _then;

/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class ReadinessStarted implements ReadinessEvent {
  const ReadinessStarted({required this.clientId});
  

@override final  String clientId;

/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessStartedCopyWith<ReadinessStarted> get copyWith => _$ReadinessStartedCopyWithImpl<ReadinessStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessStarted&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'ReadinessEvent.started(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $ReadinessStartedCopyWith<$Res> implements $ReadinessEventCopyWith<$Res> {
  factory $ReadinessStartedCopyWith(ReadinessStarted value, $Res Function(ReadinessStarted) _then) = _$ReadinessStartedCopyWithImpl;
@override @useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$ReadinessStartedCopyWithImpl<$Res>
    implements $ReadinessStartedCopyWith<$Res> {
  _$ReadinessStartedCopyWithImpl(this._self, this._then);

  final ReadinessStarted _self;
  final $Res Function(ReadinessStarted) _then;

/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,}) {
  return _then(ReadinessStarted(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ReadinessSubmitted implements ReadinessEvent {
  const ReadinessSubmitted({required this.clientId, required this.sleepQuality, required this.soreness, required this.stress});
  

@override final  String clientId;
 final  int sleepQuality;
 final  int soreness;
 final  int stress;

/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessSubmittedCopyWith<ReadinessSubmitted> get copyWith => _$ReadinessSubmittedCopyWithImpl<ReadinessSubmitted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessSubmitted&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.sleepQuality, sleepQuality) || other.sleepQuality == sleepQuality)&&(identical(other.soreness, soreness) || other.soreness == soreness)&&(identical(other.stress, stress) || other.stress == stress));
}


@override
int get hashCode => Object.hash(runtimeType,clientId,sleepQuality,soreness,stress);

@override
String toString() {
  return 'ReadinessEvent.submitted(clientId: $clientId, sleepQuality: $sleepQuality, soreness: $soreness, stress: $stress)';
}


}

/// @nodoc
abstract mixin class $ReadinessSubmittedCopyWith<$Res> implements $ReadinessEventCopyWith<$Res> {
  factory $ReadinessSubmittedCopyWith(ReadinessSubmitted value, $Res Function(ReadinessSubmitted) _then) = _$ReadinessSubmittedCopyWithImpl;
@override @useResult
$Res call({
 String clientId, int sleepQuality, int soreness, int stress
});




}
/// @nodoc
class _$ReadinessSubmittedCopyWithImpl<$Res>
    implements $ReadinessSubmittedCopyWith<$Res> {
  _$ReadinessSubmittedCopyWithImpl(this._self, this._then);

  final ReadinessSubmitted _self;
  final $Res Function(ReadinessSubmitted) _then;

/// Create a copy of ReadinessEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,Object? sleepQuality = null,Object? soreness = null,Object? stress = null,}) {
  return _then(ReadinessSubmitted(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,sleepQuality: null == sleepQuality ? _self.sleepQuality : sleepQuality // ignore: cast_nullable_to_non_nullable
as int,soreness: null == soreness ? _self.soreness : soreness // ignore: cast_nullable_to_non_nullable
as int,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
