// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progressions_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressionsListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionsListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionsListState()';
}


}

/// @nodoc
class $ProgressionsListStateCopyWith<$Res>  {
$ProgressionsListStateCopyWith(ProgressionsListState _, $Res Function(ProgressionsListState) __);
}


/// @nodoc


class _Initial implements ProgressionsListState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionsListState.initial()';
}


}




/// @nodoc


class _Loading implements ProgressionsListState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionsListState.loading()';
}


}




/// @nodoc


class _Loaded implements ProgressionsListState {
  const _Loaded(final  List<Progression> progressions): _progressions = progressions;
  

 final  List<Progression> _progressions;
 List<Progression> get progressions {
  if (_progressions is EqualUnmodifiableListView) return _progressions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progressions);
}


/// Create a copy of ProgressionsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&const DeepCollectionEquality().equals(other._progressions, _progressions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_progressions));

@override
String toString() {
  return 'ProgressionsListState.loaded(progressions: $progressions)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $ProgressionsListStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 List<Progression> progressions
});




}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of ProgressionsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progressions = null,}) {
  return _then(_Loaded(
null == progressions ? _self._progressions : progressions // ignore: cast_nullable_to_non_nullable
as List<Progression>,
  ));
}


}

/// @nodoc


class _Error implements ProgressionsListState {
  const _Error(this.failure);
  

 final  Failure failure;

/// Create a copy of ProgressionsListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProgressionsListState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $ProgressionsListStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of ProgressionsListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Error(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
