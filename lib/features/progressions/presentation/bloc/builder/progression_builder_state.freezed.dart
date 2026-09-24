// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_builder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressionBuilderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionBuilderState()';
}


}

/// @nodoc
class $ProgressionBuilderStateCopyWith<$Res>  {
$ProgressionBuilderStateCopyWith(ProgressionBuilderState _, $Res Function(ProgressionBuilderState) __);
}


/// @nodoc


class ProgressionBuilderInitial implements ProgressionBuilderState {
  const ProgressionBuilderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionBuilderState.initial()';
}


}




/// @nodoc


class ProgressionBuilderLoading implements ProgressionBuilderState {
  const ProgressionBuilderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionBuilderState.loading()';
}


}




/// @nodoc


class ProgressionBuilderLoaded implements ProgressionBuilderState {
  const ProgressionBuilderLoaded({required this.progressionId, required final  List<ProgressionLevel> levels}): _levels = levels;
  

 final  String progressionId;
 final  List<ProgressionLevel> _levels;
 List<ProgressionLevel> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}


/// Create a copy of ProgressionBuilderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionBuilderLoadedCopyWith<ProgressionBuilderLoaded> get copyWith => _$ProgressionBuilderLoadedCopyWithImpl<ProgressionBuilderLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderLoaded&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId)&&const DeepCollectionEquality().equals(other._levels, _levels));
}


@override
int get hashCode => Object.hash(runtimeType,progressionId,const DeepCollectionEquality().hash(_levels));

@override
String toString() {
  return 'ProgressionBuilderState.loaded(progressionId: $progressionId, levels: $levels)';
}


}

/// @nodoc
abstract mixin class $ProgressionBuilderLoadedCopyWith<$Res> implements $ProgressionBuilderStateCopyWith<$Res> {
  factory $ProgressionBuilderLoadedCopyWith(ProgressionBuilderLoaded value, $Res Function(ProgressionBuilderLoaded) _then) = _$ProgressionBuilderLoadedCopyWithImpl;
@useResult
$Res call({
 String progressionId, List<ProgressionLevel> levels
});




}
/// @nodoc
class _$ProgressionBuilderLoadedCopyWithImpl<$Res>
    implements $ProgressionBuilderLoadedCopyWith<$Res> {
  _$ProgressionBuilderLoadedCopyWithImpl(this._self, this._then);

  final ProgressionBuilderLoaded _self;
  final $Res Function(ProgressionBuilderLoaded) _then;

/// Create a copy of ProgressionBuilderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progressionId = null,Object? levels = null,}) {
  return _then(ProgressionBuilderLoaded(
progressionId: null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<ProgressionLevel>,
  ));
}


}

/// @nodoc


class ProgressionBuilderError implements ProgressionBuilderState {
  const ProgressionBuilderError(this.failure);
  

 final  Failure failure;

/// Create a copy of ProgressionBuilderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionBuilderErrorCopyWith<ProgressionBuilderError> get copyWith => _$ProgressionBuilderErrorCopyWithImpl<ProgressionBuilderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProgressionBuilderState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProgressionBuilderErrorCopyWith<$Res> implements $ProgressionBuilderStateCopyWith<$Res> {
  factory $ProgressionBuilderErrorCopyWith(ProgressionBuilderError value, $Res Function(ProgressionBuilderError) _then) = _$ProgressionBuilderErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ProgressionBuilderErrorCopyWithImpl<$Res>
    implements $ProgressionBuilderErrorCopyWith<$Res> {
  _$ProgressionBuilderErrorCopyWithImpl(this._self, this._then);

  final ProgressionBuilderError _self;
  final $Res Function(ProgressionBuilderError) _then;

/// Create a copy of ProgressionBuilderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ProgressionBuilderError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
