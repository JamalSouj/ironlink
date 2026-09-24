// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// @nodoc


class AuthStarted implements AuthEvent {
  const AuthStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.started()';
}


}




/// @nodoc


class SignInRequested implements AuthEvent {
  const SignInRequested({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignInRequestedCopyWith<SignInRequested> get copyWith => _$SignInRequestedCopyWithImpl<SignInRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignInRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signInRequested(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class $SignInRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignInRequestedCopyWith(SignInRequested value, $Res Function(SignInRequested) _then) = _$SignInRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class _$SignInRequestedCopyWithImpl<$Res>
    implements $SignInRequestedCopyWith<$Res> {
  _$SignInRequestedCopyWithImpl(this._self, this._then);

  final SignInRequested _self;
  final $Res Function(SignInRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(SignInRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpCoachRequested implements AuthEvent {
  const SignUpCoachRequested({required this.email, required this.password, required this.fullName});
  

 final  String email;
 final  String password;
 final  String fullName;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpCoachRequestedCopyWith<SignUpCoachRequested> get copyWith => _$SignUpCoachRequestedCopyWithImpl<SignUpCoachRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpCoachRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,fullName);

@override
String toString() {
  return 'AuthEvent.signUpCoachRequested(email: $email, password: $password, fullName: $fullName)';
}


}

/// @nodoc
abstract mixin class $SignUpCoachRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignUpCoachRequestedCopyWith(SignUpCoachRequested value, $Res Function(SignUpCoachRequested) _then) = _$SignUpCoachRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password, String fullName
});




}
/// @nodoc
class _$SignUpCoachRequestedCopyWithImpl<$Res>
    implements $SignUpCoachRequestedCopyWith<$Res> {
  _$SignUpCoachRequestedCopyWithImpl(this._self, this._then);

  final SignUpCoachRequested _self;
  final $Res Function(SignUpCoachRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? fullName = null,}) {
  return _then(SignUpCoachRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SignUpClientRequested implements AuthEvent {
  const SignUpClientRequested({required this.email, required this.password, required this.fullName, this.inviteCode});
  

 final  String email;
 final  String password;
 final  String fullName;
 final  String? inviteCode;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignUpClientRequestedCopyWith<SignUpClientRequested> get copyWith => _$SignUpClientRequestedCopyWithImpl<SignUpClientRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignUpClientRequested&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,fullName,inviteCode);

@override
String toString() {
  return 'AuthEvent.signUpClientRequested(email: $email, password: $password, fullName: $fullName, inviteCode: $inviteCode)';
}


}

/// @nodoc
abstract mixin class $SignUpClientRequestedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $SignUpClientRequestedCopyWith(SignUpClientRequested value, $Res Function(SignUpClientRequested) _then) = _$SignUpClientRequestedCopyWithImpl;
@useResult
$Res call({
 String email, String password, String fullName, String? inviteCode
});




}
/// @nodoc
class _$SignUpClientRequestedCopyWithImpl<$Res>
    implements $SignUpClientRequestedCopyWith<$Res> {
  _$SignUpClientRequestedCopyWithImpl(this._self, this._then);

  final SignUpClientRequested _self;
  final $Res Function(SignUpClientRequested) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? fullName = null,Object? inviteCode = freezed,}) {
  return _then(SignUpClientRequested(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,inviteCode: freezed == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SignOutRequested implements AuthEvent {
  const SignOutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignOutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signOutRequested()';
}


}




// dart format on
