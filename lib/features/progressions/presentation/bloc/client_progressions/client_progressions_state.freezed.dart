// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_progressions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientProgressionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientProgressionsState()';
}


}

/// @nodoc
class $ClientProgressionsStateCopyWith<$Res>  {
$ClientProgressionsStateCopyWith(ClientProgressionsState _, $Res Function(ClientProgressionsState) __);
}


/// @nodoc


class ClientProgressionsInitial implements ClientProgressionsState {
  const ClientProgressionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientProgressionsState.initial()';
}


}




/// @nodoc


class ClientProgressionsLoading implements ClientProgressionsState {
  const ClientProgressionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientProgressionsState.loading()';
}


}




/// @nodoc


class ClientProgressionsLoaded implements ClientProgressionsState {
  const ClientProgressionsLoaded(final  List<ClientProgressionStatus> progressions): _progressions = progressions;
  

 final  List<ClientProgressionStatus> _progressions;
 List<ClientProgressionStatus> get progressions {
  if (_progressions is EqualUnmodifiableListView) return _progressions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progressions);
}


/// Create a copy of ClientProgressionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProgressionsLoadedCopyWith<ClientProgressionsLoaded> get copyWith => _$ClientProgressionsLoadedCopyWithImpl<ClientProgressionsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsLoaded&&const DeepCollectionEquality().equals(other._progressions, _progressions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_progressions));

@override
String toString() {
  return 'ClientProgressionsState.loaded(progressions: $progressions)';
}


}

/// @nodoc
abstract mixin class $ClientProgressionsLoadedCopyWith<$Res> implements $ClientProgressionsStateCopyWith<$Res> {
  factory $ClientProgressionsLoadedCopyWith(ClientProgressionsLoaded value, $Res Function(ClientProgressionsLoaded) _then) = _$ClientProgressionsLoadedCopyWithImpl;
@useResult
$Res call({
 List<ClientProgressionStatus> progressions
});




}
/// @nodoc
class _$ClientProgressionsLoadedCopyWithImpl<$Res>
    implements $ClientProgressionsLoadedCopyWith<$Res> {
  _$ClientProgressionsLoadedCopyWithImpl(this._self, this._then);

  final ClientProgressionsLoaded _self;
  final $Res Function(ClientProgressionsLoaded) _then;

/// Create a copy of ClientProgressionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progressions = null,}) {
  return _then(ClientProgressionsLoaded(
null == progressions ? _self._progressions : progressions // ignore: cast_nullable_to_non_nullable
as List<ClientProgressionStatus>,
  ));
}


}

/// @nodoc


class ClientProgressionsError implements ClientProgressionsState {
  const ClientProgressionsError(this.failure);
  

 final  Failure failure;

/// Create a copy of ClientProgressionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProgressionsErrorCopyWith<ClientProgressionsError> get copyWith => _$ClientProgressionsErrorCopyWithImpl<ClientProgressionsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionsError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ClientProgressionsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ClientProgressionsErrorCopyWith<$Res> implements $ClientProgressionsStateCopyWith<$Res> {
  factory $ClientProgressionsErrorCopyWith(ClientProgressionsError value, $Res Function(ClientProgressionsError) _then) = _$ClientProgressionsErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ClientProgressionsErrorCopyWithImpl<$Res>
    implements $ClientProgressionsErrorCopyWith<$Res> {
  _$ClientProgressionsErrorCopyWithImpl(this._self, this._then);

  final ClientProgressionsError _self;
  final $Res Function(ClientProgressionsError) _then;

/// Create a copy of ClientProgressionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ClientProgressionsError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
