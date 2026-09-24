// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'roster_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RosterState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RosterState()';
}


}

/// @nodoc
class $RosterStateCopyWith<$Res>  {
$RosterStateCopyWith(RosterState _, $Res Function(RosterState) __);
}


/// @nodoc


class RosterInitial implements RosterState {
  const RosterInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RosterState.initial()';
}


}




/// @nodoc


class RosterLoading implements RosterState {
  const RosterLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RosterState.loading()';
}


}




/// @nodoc


class RosterLoaded implements RosterState {
  const RosterLoaded(final  List<ClientSummary> clients): _clients = clients;
  

 final  List<ClientSummary> _clients;
 List<ClientSummary> get clients {
  if (_clients is EqualUnmodifiableListView) return _clients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_clients);
}


/// Create a copy of RosterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosterLoadedCopyWith<RosterLoaded> get copyWith => _$RosterLoadedCopyWithImpl<RosterLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterLoaded&&const DeepCollectionEquality().equals(other._clients, _clients));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_clients));

@override
String toString() {
  return 'RosterState.loaded(clients: $clients)';
}


}

/// @nodoc
abstract mixin class $RosterLoadedCopyWith<$Res> implements $RosterStateCopyWith<$Res> {
  factory $RosterLoadedCopyWith(RosterLoaded value, $Res Function(RosterLoaded) _then) = _$RosterLoadedCopyWithImpl;
@useResult
$Res call({
 List<ClientSummary> clients
});




}
/// @nodoc
class _$RosterLoadedCopyWithImpl<$Res>
    implements $RosterLoadedCopyWith<$Res> {
  _$RosterLoadedCopyWithImpl(this._self, this._then);

  final RosterLoaded _self;
  final $Res Function(RosterLoaded) _then;

/// Create a copy of RosterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? clients = null,}) {
  return _then(RosterLoaded(
null == clients ? _self._clients : clients // ignore: cast_nullable_to_non_nullable
as List<ClientSummary>,
  ));
}


}

/// @nodoc


class RosterError implements RosterState {
  const RosterError(this.failure);
  

 final  Failure failure;

/// Create a copy of RosterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RosterErrorCopyWith<RosterError> get copyWith => _$RosterErrorCopyWithImpl<RosterError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RosterError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'RosterState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $RosterErrorCopyWith<$Res> implements $RosterStateCopyWith<$Res> {
  factory $RosterErrorCopyWith(RosterError value, $Res Function(RosterError) _then) = _$RosterErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$RosterErrorCopyWithImpl<$Res>
    implements $RosterErrorCopyWith<$Res> {
  _$RosterErrorCopyWithImpl(this._self, this._then);

  final RosterError _self;
  final $Res Function(RosterError) _then;

/// Create a copy of RosterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(RosterError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
