// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_builder_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgramBuilderState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramBuilderState()';
}


}

/// @nodoc
class $ProgramBuilderStateCopyWith<$Res>  {
$ProgramBuilderStateCopyWith(ProgramBuilderState _, $Res Function(ProgramBuilderState) __);
}


/// @nodoc


class ProgramBuilderInitial implements ProgramBuilderState {
  const ProgramBuilderInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramBuilderState.initial()';
}


}




/// @nodoc


class ProgramBuilderLoading implements ProgramBuilderState {
  const ProgramBuilderLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgramBuilderState.loading()';
}


}




/// @nodoc


class ProgramBuilderLoaded implements ProgramBuilderState {
  const ProgramBuilderLoaded({required final  List<ProgramBlock> blocks}): _blocks = blocks;
  

 final  List<ProgramBlock> _blocks;
 List<ProgramBlock> get blocks {
  if (_blocks is EqualUnmodifiableListView) return _blocks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blocks);
}


/// Create a copy of ProgramBuilderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderLoadedCopyWith<ProgramBuilderLoaded> get copyWith => _$ProgramBuilderLoadedCopyWithImpl<ProgramBuilderLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderLoaded&&const DeepCollectionEquality().equals(other._blocks, _blocks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_blocks));

@override
String toString() {
  return 'ProgramBuilderState.loaded(blocks: $blocks)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderLoadedCopyWith<$Res> implements $ProgramBuilderStateCopyWith<$Res> {
  factory $ProgramBuilderLoadedCopyWith(ProgramBuilderLoaded value, $Res Function(ProgramBuilderLoaded) _then) = _$ProgramBuilderLoadedCopyWithImpl;
@useResult
$Res call({
 List<ProgramBlock> blocks
});




}
/// @nodoc
class _$ProgramBuilderLoadedCopyWithImpl<$Res>
    implements $ProgramBuilderLoadedCopyWith<$Res> {
  _$ProgramBuilderLoadedCopyWithImpl(this._self, this._then);

  final ProgramBuilderLoaded _self;
  final $Res Function(ProgramBuilderLoaded) _then;

/// Create a copy of ProgramBuilderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? blocks = null,}) {
  return _then(ProgramBuilderLoaded(
blocks: null == blocks ? _self._blocks : blocks // ignore: cast_nullable_to_non_nullable
as List<ProgramBlock>,
  ));
}


}

/// @nodoc


class ProgramBuilderError implements ProgramBuilderState {
  const ProgramBuilderError({required this.failure});
  

 final  Failure failure;

/// Create a copy of ProgramBuilderState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBuilderErrorCopyWith<ProgramBuilderError> get copyWith => _$ProgramBuilderErrorCopyWithImpl<ProgramBuilderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBuilderError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ProgramBuilderState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ProgramBuilderErrorCopyWith<$Res> implements $ProgramBuilderStateCopyWith<$Res> {
  factory $ProgramBuilderErrorCopyWith(ProgramBuilderError value, $Res Function(ProgramBuilderError) _then) = _$ProgramBuilderErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ProgramBuilderErrorCopyWithImpl<$Res>
    implements $ProgramBuilderErrorCopyWith<$Res> {
  _$ProgramBuilderErrorCopyWithImpl(this._self, this._then);

  final ProgramBuilderError _self;
  final $Res Function(ProgramBuilderError) _then;

/// Create a copy of ProgramBuilderState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ProgramBuilderError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
