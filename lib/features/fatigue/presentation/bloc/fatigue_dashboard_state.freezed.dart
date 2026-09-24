// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fatigue_dashboard_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FatigueDashboardState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FatigueDashboardState()';
}


}

/// @nodoc
class $FatigueDashboardStateCopyWith<$Res>  {
$FatigueDashboardStateCopyWith(FatigueDashboardState _, $Res Function(FatigueDashboardState) __);
}


/// @nodoc


class FatigueDashboardInitial implements FatigueDashboardState {
  const FatigueDashboardInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FatigueDashboardState.initial()';
}


}




/// @nodoc


class FatigueDashboardLoading implements FatigueDashboardState {
  const FatigueDashboardLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'FatigueDashboardState.loading()';
}


}




/// @nodoc


class FatigueDashboardLoaded implements FatigueDashboardState {
  const FatigueDashboardLoaded({required final  List<TrainingLoadPoint> data, required this.isAtRisk}): _data = data;
  

 final  List<TrainingLoadPoint> _data;
 List<TrainingLoadPoint> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

 final  bool isAtRisk;

/// Create a copy of FatigueDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FatigueDashboardLoadedCopyWith<FatigueDashboardLoaded> get copyWith => _$FatigueDashboardLoadedCopyWithImpl<FatigueDashboardLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardLoaded&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.isAtRisk, isAtRisk) || other.isAtRisk == isAtRisk));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),isAtRisk);

@override
String toString() {
  return 'FatigueDashboardState.loaded(data: $data, isAtRisk: $isAtRisk)';
}


}

/// @nodoc
abstract mixin class $FatigueDashboardLoadedCopyWith<$Res> implements $FatigueDashboardStateCopyWith<$Res> {
  factory $FatigueDashboardLoadedCopyWith(FatigueDashboardLoaded value, $Res Function(FatigueDashboardLoaded) _then) = _$FatigueDashboardLoadedCopyWithImpl;
@useResult
$Res call({
 List<TrainingLoadPoint> data, bool isAtRisk
});




}
/// @nodoc
class _$FatigueDashboardLoadedCopyWithImpl<$Res>
    implements $FatigueDashboardLoadedCopyWith<$Res> {
  _$FatigueDashboardLoadedCopyWithImpl(this._self, this._then);

  final FatigueDashboardLoaded _self;
  final $Res Function(FatigueDashboardLoaded) _then;

/// Create a copy of FatigueDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,Object? isAtRisk = null,}) {
  return _then(FatigueDashboardLoaded(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TrainingLoadPoint>,isAtRisk: null == isAtRisk ? _self.isAtRisk : isAtRisk // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class FatigueDashboardError implements FatigueDashboardState {
  const FatigueDashboardError({required this.failure});
  

 final  Failure failure;

/// Create a copy of FatigueDashboardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FatigueDashboardErrorCopyWith<FatigueDashboardError> get copyWith => _$FatigueDashboardErrorCopyWithImpl<FatigueDashboardError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'FatigueDashboardState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $FatigueDashboardErrorCopyWith<$Res> implements $FatigueDashboardStateCopyWith<$Res> {
  factory $FatigueDashboardErrorCopyWith(FatigueDashboardError value, $Res Function(FatigueDashboardError) _then) = _$FatigueDashboardErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$FatigueDashboardErrorCopyWithImpl<$Res>
    implements $FatigueDashboardErrorCopyWith<$Res> {
  _$FatigueDashboardErrorCopyWithImpl(this._self, this._then);

  final FatigueDashboardError _self;
  final $Res Function(FatigueDashboardError) _then;

/// Create a copy of FatigueDashboardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(FatigueDashboardError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
