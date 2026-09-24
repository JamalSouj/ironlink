// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InviteState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState()';
}


}

/// @nodoc
class $InviteStateCopyWith<$Res>  {
$InviteStateCopyWith(InviteState _, $Res Function(InviteState) __);
}


/// @nodoc


class InviteInitial implements InviteState {
  const InviteInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState.initial()';
}


}




/// @nodoc


class InviteGenerating implements InviteState {
  const InviteGenerating();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteGenerating);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteState.generating()';
}


}




/// @nodoc


class InviteGenerated implements InviteState {
  const InviteGenerated(this.inviteCode);
  

 final  String inviteCode;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteGeneratedCopyWith<InviteGenerated> get copyWith => _$InviteGeneratedCopyWithImpl<InviteGenerated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteGenerated&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode));
}


@override
int get hashCode => Object.hash(runtimeType,inviteCode);

@override
String toString() {
  return 'InviteState.generated(inviteCode: $inviteCode)';
}


}

/// @nodoc
abstract mixin class $InviteGeneratedCopyWith<$Res> implements $InviteStateCopyWith<$Res> {
  factory $InviteGeneratedCopyWith(InviteGenerated value, $Res Function(InviteGenerated) _then) = _$InviteGeneratedCopyWithImpl;
@useResult
$Res call({
 String inviteCode
});




}
/// @nodoc
class _$InviteGeneratedCopyWithImpl<$Res>
    implements $InviteGeneratedCopyWith<$Res> {
  _$InviteGeneratedCopyWithImpl(this._self, this._then);

  final InviteGenerated _self;
  final $Res Function(InviteGenerated) _then;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inviteCode = null,}) {
  return _then(InviteGenerated(
null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InviteError implements InviteState {
  const InviteError(this.failure);
  

 final  Failure failure;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteErrorCopyWith<InviteError> get copyWith => _$InviteErrorCopyWithImpl<InviteError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'InviteState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $InviteErrorCopyWith<$Res> implements $InviteStateCopyWith<$Res> {
  factory $InviteErrorCopyWith(InviteError value, $Res Function(InviteError) _then) = _$InviteErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$InviteErrorCopyWithImpl<$Res>
    implements $InviteErrorCopyWith<$Res> {
  _$InviteErrorCopyWithImpl(this._self, this._then);

  final InviteError _self;
  final $Res Function(InviteError) _then;

/// Create a copy of InviteState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(InviteError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
