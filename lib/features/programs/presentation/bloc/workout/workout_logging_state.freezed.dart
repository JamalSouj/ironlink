// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_logging_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WorkoutLoggingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutLoggingState()';
}


}

/// @nodoc
class $WorkoutLoggingStateCopyWith<$Res>  {
$WorkoutLoggingStateCopyWith(WorkoutLoggingState _, $Res Function(WorkoutLoggingState) __);
}


/// @nodoc


class WorkoutLoggingInitial implements WorkoutLoggingState {
  const WorkoutLoggingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutLoggingState.initial()';
}


}




/// @nodoc


class WorkoutLoggingActive implements WorkoutLoggingState {
  const WorkoutLoggingActive();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingActive);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutLoggingState.active()';
}


}




/// @nodoc


class WorkoutLoggingSubmitting implements WorkoutLoggingState {
  const WorkoutLoggingSubmitting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingSubmitting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WorkoutLoggingState.submitting()';
}


}




/// @nodoc


class WorkoutLoggingCompleted implements WorkoutLoggingState {
  const WorkoutLoggingCompleted({final  List<ProgressionLevel> unlockedLevels = const []}): _unlockedLevels = unlockedLevels;
  

// We can pass unlocked levels here later
 final  List<ProgressionLevel> _unlockedLevels;
// We can pass unlocked levels here later
@JsonKey() List<ProgressionLevel> get unlockedLevels {
  if (_unlockedLevels is EqualUnmodifiableListView) return _unlockedLevels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unlockedLevels);
}


/// Create a copy of WorkoutLoggingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutLoggingCompletedCopyWith<WorkoutLoggingCompleted> get copyWith => _$WorkoutLoggingCompletedCopyWithImpl<WorkoutLoggingCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingCompleted&&const DeepCollectionEquality().equals(other._unlockedLevels, _unlockedLevels));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_unlockedLevels));

@override
String toString() {
  return 'WorkoutLoggingState.completed(unlockedLevels: $unlockedLevels)';
}


}

/// @nodoc
abstract mixin class $WorkoutLoggingCompletedCopyWith<$Res> implements $WorkoutLoggingStateCopyWith<$Res> {
  factory $WorkoutLoggingCompletedCopyWith(WorkoutLoggingCompleted value, $Res Function(WorkoutLoggingCompleted) _then) = _$WorkoutLoggingCompletedCopyWithImpl;
@useResult
$Res call({
 List<ProgressionLevel> unlockedLevels
});




}
/// @nodoc
class _$WorkoutLoggingCompletedCopyWithImpl<$Res>
    implements $WorkoutLoggingCompletedCopyWith<$Res> {
  _$WorkoutLoggingCompletedCopyWithImpl(this._self, this._then);

  final WorkoutLoggingCompleted _self;
  final $Res Function(WorkoutLoggingCompleted) _then;

/// Create a copy of WorkoutLoggingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? unlockedLevels = null,}) {
  return _then(WorkoutLoggingCompleted(
unlockedLevels: null == unlockedLevels ? _self._unlockedLevels : unlockedLevels // ignore: cast_nullable_to_non_nullable
as List<ProgressionLevel>,
  ));
}


}

/// @nodoc


class WorkoutLoggingError implements WorkoutLoggingState {
  const WorkoutLoggingError({required this.failure});
  

 final  Failure failure;

/// Create a copy of WorkoutLoggingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutLoggingErrorCopyWith<WorkoutLoggingError> get copyWith => _$WorkoutLoggingErrorCopyWithImpl<WorkoutLoggingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutLoggingError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'WorkoutLoggingState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $WorkoutLoggingErrorCopyWith<$Res> implements $WorkoutLoggingStateCopyWith<$Res> {
  factory $WorkoutLoggingErrorCopyWith(WorkoutLoggingError value, $Res Function(WorkoutLoggingError) _then) = _$WorkoutLoggingErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$WorkoutLoggingErrorCopyWithImpl<$Res>
    implements $WorkoutLoggingErrorCopyWith<$Res> {
  _$WorkoutLoggingErrorCopyWithImpl(this._self, this._then);

  final WorkoutLoggingError _self;
  final $Res Function(WorkoutLoggingError) _then;

/// Create a copy of WorkoutLoggingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(WorkoutLoggingError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
