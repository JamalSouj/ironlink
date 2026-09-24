// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'readiness_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadinessState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadinessState()';
}


}

/// @nodoc
class $ReadinessStateCopyWith<$Res>  {
$ReadinessStateCopyWith(ReadinessState _, $Res Function(ReadinessState) __);
}


/// @nodoc


class ReadinessInitial implements ReadinessState {
  const ReadinessInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadinessState.initial()';
}


}




/// @nodoc


class ReadinessLoading implements ReadinessState {
  const ReadinessLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadinessState.loading()';
}


}




/// @nodoc


class ReadinessNeedsSubmission implements ReadinessState {
  const ReadinessNeedsSubmission();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessNeedsSubmission);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadinessState.needsSubmission()';
}


}




/// @nodoc


class ReadinessCompleted implements ReadinessState {
  const ReadinessCompleted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadinessState.completed()';
}


}




/// @nodoc


class ReadinessError implements ReadinessState {
  const ReadinessError({required this.failure});
  

 final  Failure failure;

/// Create a copy of ReadinessState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessErrorCopyWith<ReadinessError> get copyWith => _$ReadinessErrorCopyWithImpl<ReadinessError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ReadinessState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ReadinessErrorCopyWith<$Res> implements $ReadinessStateCopyWith<$Res> {
  factory $ReadinessErrorCopyWith(ReadinessError value, $Res Function(ReadinessError) _then) = _$ReadinessErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ReadinessErrorCopyWithImpl<$Res>
    implements $ReadinessErrorCopyWith<$Res> {
  _$ReadinessErrorCopyWithImpl(this._self, this._then);

  final ReadinessError _self;
  final $Res Function(ReadinessError) _then;

/// Create a copy of ReadinessState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ReadinessError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
