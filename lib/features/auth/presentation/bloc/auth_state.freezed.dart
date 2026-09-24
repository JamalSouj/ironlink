// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState()';
}


}

/// @nodoc
class $AuthStateCopyWith<$Res>  {
$AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}


/// @nodoc


class Unauthenticated implements AuthState {
  const Unauthenticated();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Unauthenticated);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.unauthenticated()';
}


}




/// @nodoc


class Authenticating implements AuthState {
  const Authenticating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Authenticating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthState.authenticating()';
}


}




/// @nodoc


class AuthenticatedCoach implements AuthState {
  const AuthenticatedCoach({required this.user});
  

 final  AuthUser user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedCoachCopyWith<AuthenticatedCoach> get copyWith => _$AuthenticatedCoachCopyWithImpl<AuthenticatedCoach>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedCoach&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticatedCoach(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedCoachCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedCoachCopyWith(AuthenticatedCoach value, $Res Function(AuthenticatedCoach) _then) = _$AuthenticatedCoachCopyWithImpl;
@useResult
$Res call({
 AuthUser user
});




}
/// @nodoc
class _$AuthenticatedCoachCopyWithImpl<$Res>
    implements $AuthenticatedCoachCopyWith<$Res> {
  _$AuthenticatedCoachCopyWithImpl(this._self, this._then);

  final AuthenticatedCoach _self;
  final $Res Function(AuthenticatedCoach) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthenticatedCoach(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}


}

/// @nodoc


class AuthenticatedClient implements AuthState {
  const AuthenticatedClient({required this.user});
  

 final  AuthUser user;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthenticatedClientCopyWith<AuthenticatedClient> get copyWith => _$AuthenticatedClientCopyWithImpl<AuthenticatedClient>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthenticatedClient&&(identical(other.user, user) || other.user == user));
}


@override
int get hashCode => Object.hash(runtimeType,user);

@override
String toString() {
  return 'AuthState.authenticatedClient(user: $user)';
}


}

/// @nodoc
abstract mixin class $AuthenticatedClientCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthenticatedClientCopyWith(AuthenticatedClient value, $Res Function(AuthenticatedClient) _then) = _$AuthenticatedClientCopyWithImpl;
@useResult
$Res call({
 AuthUser user
});




}
/// @nodoc
class _$AuthenticatedClientCopyWithImpl<$Res>
    implements $AuthenticatedClientCopyWith<$Res> {
  _$AuthenticatedClientCopyWithImpl(this._self, this._then);

  final AuthenticatedClient _self;
  final $Res Function(AuthenticatedClient) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? user = null,}) {
  return _then(AuthenticatedClient(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as AuthUser,
  ));
}


}

/// @nodoc


class AuthError implements AuthState {
  const AuthError({required this.failure});
  

 final  Failure failure;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthErrorCopyWith<AuthError> get copyWith => _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'AuthState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $AuthErrorCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) _then) = _$AuthErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$AuthErrorCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._self, this._then);

  final AuthError _self;
  final $Res Function(AuthError) _then;

/// Create a copy of AuthState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(AuthError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
