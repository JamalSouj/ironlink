// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_logging_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutLoggingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutLoggingEvent()';
}


}

/// @nodoc
class $WorkoutLoggingEventCopyWith<$Res>  {
$WorkoutLoggingEventCopyWith(WorkoutLoggingEvent _, $Res Function(WorkoutLoggingEvent) __);
}


/// @nodoc


class WorkoutLoggingStarted implements WorkoutLoggingEvent {
  const WorkoutLoggingStarted({required this.sessionId});
  

 final  String sessionId;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutLoggingStartedCopyWith<WorkoutLoggingStarted> get copyWith => _$WorkoutLoggingStartedCopyWithImpl<WorkoutLoggingStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingStarted&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId);

@override
String toString() {
  return 'WorkoutLoggingEvent.started(sessionId: $sessionId)';
}


}

/// @nodoc
abstract mixin class $WorkoutLoggingStartedCopyWith<$Res> implements $WorkoutLoggingEventCopyWith<$Res> {
  factory $WorkoutLoggingStartedCopyWith(WorkoutLoggingStarted value, $Res Function(WorkoutLoggingStarted) _then) = _$WorkoutLoggingStartedCopyWithImpl;
@useResult
$Res call({
 String sessionId
});




}
/// @nodoc
class _$WorkoutLoggingStartedCopyWithImpl<$Res>
    implements $WorkoutLoggingStartedCopyWith<$Res> {
  _$WorkoutLoggingStartedCopyWithImpl(this._self, this._then);

  final WorkoutLoggingStarted _self;
  final $Res Function(WorkoutLoggingStarted) _then;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,}) {
  return _then(WorkoutLoggingStarted(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class WorkoutSetLogged implements WorkoutLoggingEvent {
  const WorkoutSetLogged({required this.setLog});
  

 final  SetLog setLog;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSetLoggedCopyWith<WorkoutSetLogged> get copyWith => _$WorkoutSetLoggedCopyWithImpl<WorkoutSetLogged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSetLogged&&(identical(other.setLog, setLog) || other.setLog == setLog));
}


@override
int get hashCode => Object.hash(runtimeType,setLog);

@override
String toString() {
  return 'WorkoutLoggingEvent.setLogged(setLog: $setLog)';
}


}

/// @nodoc
abstract mixin class $WorkoutSetLoggedCopyWith<$Res> implements $WorkoutLoggingEventCopyWith<$Res> {
  factory $WorkoutSetLoggedCopyWith(WorkoutSetLogged value, $Res Function(WorkoutSetLogged) _then) = _$WorkoutSetLoggedCopyWithImpl;
@useResult
$Res call({
 SetLog setLog
});




}
/// @nodoc
class _$WorkoutSetLoggedCopyWithImpl<$Res>
    implements $WorkoutSetLoggedCopyWith<$Res> {
  _$WorkoutSetLoggedCopyWithImpl(this._self, this._then);

  final WorkoutSetLogged _self;
  final $Res Function(WorkoutSetLogged) _then;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? setLog = null,}) {
  return _then(WorkoutSetLogged(
setLog: null == setLog ? _self.setLog : setLog // ignore: cast_nullable_to_non_nullable
as SetLog,
  ));
}


}

/// @nodoc


class WorkoutSessionCompleted implements WorkoutLoggingEvent {
  const WorkoutSessionCompleted({required this.sessionId, required this.sessionRpe, required this.durationMinutes});
  

 final  String sessionId;
 final  int sessionRpe;
 final  int durationMinutes;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionCompletedCopyWith<WorkoutSessionCompleted> get copyWith => _$WorkoutSessionCompletedCopyWithImpl<WorkoutSessionCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionCompleted&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.sessionRpe, sessionRpe) || other.sessionRpe == sessionRpe)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}


@override
int get hashCode => Object.hash(runtimeType,sessionId,sessionRpe,durationMinutes);

@override
String toString() {
  return 'WorkoutLoggingEvent.sessionCompleted(sessionId: $sessionId, sessionRpe: $sessionRpe, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionCompletedCopyWith<$Res> implements $WorkoutLoggingEventCopyWith<$Res> {
  factory $WorkoutSessionCompletedCopyWith(WorkoutSessionCompleted value, $Res Function(WorkoutSessionCompleted) _then) = _$WorkoutSessionCompletedCopyWithImpl;
@useResult
$Res call({
 String sessionId, int sessionRpe, int durationMinutes
});




}
/// @nodoc
class _$WorkoutSessionCompletedCopyWithImpl<$Res>
    implements $WorkoutSessionCompletedCopyWith<$Res> {
  _$WorkoutSessionCompletedCopyWithImpl(this._self, this._then);

  final WorkoutSessionCompleted _self;
  final $Res Function(WorkoutSessionCompleted) _then;

/// Create a copy of WorkoutLoggingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? sessionRpe = null,Object? durationMinutes = null,}) {
  return _then(WorkoutSessionCompleted(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,sessionRpe: null == sessionRpe ? _self.sessionRpe : sessionRpe // ignore: cast_nullable_to_non_nullable
as int,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
