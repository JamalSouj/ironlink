// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_today_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientTodayState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientTodayState()';
}


}

/// @nodoc
class $ClientTodayStateCopyWith<$Res>  {
$ClientTodayStateCopyWith(ClientTodayState _, $Res Function(ClientTodayState) __);
}


/// @nodoc


class ClientTodayInitial implements ClientTodayState {
  const ClientTodayInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientTodayState.initial()';
}


}




/// @nodoc


class ClientTodayLoading implements ClientTodayState {
  const ClientTodayLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientTodayState.loading()';
}


}




/// @nodoc


class ClientTodayLoaded implements ClientTodayState {
  const ClientTodayLoaded({required this.session});
  

 final  WorkoutSession? session;

/// Create a copy of ClientTodayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientTodayLoadedCopyWith<ClientTodayLoaded> get copyWith => _$ClientTodayLoadedCopyWithImpl<ClientTodayLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayLoaded&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'ClientTodayState.loaded(session: $session)';
}


}

/// @nodoc
abstract mixin class $ClientTodayLoadedCopyWith<$Res> implements $ClientTodayStateCopyWith<$Res> {
  factory $ClientTodayLoadedCopyWith(ClientTodayLoaded value, $Res Function(ClientTodayLoaded) _then) = _$ClientTodayLoadedCopyWithImpl;
@useResult
$Res call({
 WorkoutSession? session
});




}
/// @nodoc
class _$ClientTodayLoadedCopyWithImpl<$Res>
    implements $ClientTodayLoadedCopyWith<$Res> {
  _$ClientTodayLoadedCopyWithImpl(this._self, this._then);

  final ClientTodayLoaded _self;
  final $Res Function(ClientTodayLoaded) _then;

/// Create a copy of ClientTodayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = freezed,}) {
  return _then(ClientTodayLoaded(
session: freezed == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as WorkoutSession?,
  ));
}


}

/// @nodoc


class ClientTodayError implements ClientTodayState {
  const ClientTodayError({required this.failure});
  

 final  Failure failure;

/// Create a copy of ClientTodayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientTodayErrorCopyWith<ClientTodayError> get copyWith => _$ClientTodayErrorCopyWithImpl<ClientTodayError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientTodayError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClientTodayState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ClientTodayErrorCopyWith<$Res> implements $ClientTodayStateCopyWith<$Res> {
  factory $ClientTodayErrorCopyWith(ClientTodayError value, $Res Function(ClientTodayError) _then) = _$ClientTodayErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ClientTodayErrorCopyWithImpl<$Res>
    implements $ClientTodayErrorCopyWith<$Res> {
  _$ClientTodayErrorCopyWithImpl(this._self, this._then);

  final ClientTodayError _self;
  final $Res Function(ClientTodayError) _then;

/// Create a copy of ClientTodayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ClientTodayError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
