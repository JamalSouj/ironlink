// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_builder_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProgressionBuilderEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProgressionBuilderEvent()';
}


}

/// @nodoc
class $ProgressionBuilderEventCopyWith<$Res>  {
$ProgressionBuilderEventCopyWith(ProgressionBuilderEvent _, $Res Function(ProgressionBuilderEvent) __);
}


/// @nodoc


class ProgressionBuilderStarted implements ProgressionBuilderEvent {
  const ProgressionBuilderStarted(this.progressionId);
  

 final  String progressionId;

/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionBuilderStartedCopyWith<ProgressionBuilderStarted> get copyWith => _$ProgressionBuilderStartedCopyWithImpl<ProgressionBuilderStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderStarted&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId));
}


@override
int get hashCode => Object.hash(runtimeType,progressionId);

@override
String toString() {
  return 'ProgressionBuilderEvent.started(progressionId: $progressionId)';
}


}

/// @nodoc
abstract mixin class $ProgressionBuilderStartedCopyWith<$Res> implements $ProgressionBuilderEventCopyWith<$Res> {
  factory $ProgressionBuilderStartedCopyWith(ProgressionBuilderStarted value, $Res Function(ProgressionBuilderStarted) _then) = _$ProgressionBuilderStartedCopyWithImpl;
@useResult
$Res call({
 String progressionId
});




}
/// @nodoc
class _$ProgressionBuilderStartedCopyWithImpl<$Res>
    implements $ProgressionBuilderStartedCopyWith<$Res> {
  _$ProgressionBuilderStartedCopyWithImpl(this._self, this._then);

  final ProgressionBuilderStarted _self;
  final $Res Function(ProgressionBuilderStarted) _then;

/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? progressionId = null,}) {
  return _then(ProgressionBuilderStarted(
null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class ProgressionBuilderLevelAdded implements ProgressionBuilderEvent {
  const ProgressionBuilderLevelAdded({required this.exerciseId, required final  Map<String, dynamic> unlockCriteria}): _unlockCriteria = unlockCriteria;
  

 final  String exerciseId;
 final  Map<String, dynamic> _unlockCriteria;
 Map<String, dynamic> get unlockCriteria {
  if (_unlockCriteria is EqualUnmodifiableMapView) return _unlockCriteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_unlockCriteria);
}


/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionBuilderLevelAddedCopyWith<ProgressionBuilderLevelAdded> get copyWith => _$ProgressionBuilderLevelAddedCopyWithImpl<ProgressionBuilderLevelAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderLevelAdded&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&const DeepCollectionEquality().equals(other._unlockCriteria, _unlockCriteria));
}


@override
int get hashCode => Object.hash(runtimeType,exerciseId,const DeepCollectionEquality().hash(_unlockCriteria));

@override
String toString() {
  return 'ProgressionBuilderEvent.levelAdded(exerciseId: $exerciseId, unlockCriteria: $unlockCriteria)';
}


}

/// @nodoc
abstract mixin class $ProgressionBuilderLevelAddedCopyWith<$Res> implements $ProgressionBuilderEventCopyWith<$Res> {
  factory $ProgressionBuilderLevelAddedCopyWith(ProgressionBuilderLevelAdded value, $Res Function(ProgressionBuilderLevelAdded) _then) = _$ProgressionBuilderLevelAddedCopyWithImpl;
@useResult
$Res call({
 String exerciseId, Map<String, dynamic> unlockCriteria
});




}
/// @nodoc
class _$ProgressionBuilderLevelAddedCopyWithImpl<$Res>
    implements $ProgressionBuilderLevelAddedCopyWith<$Res> {
  _$ProgressionBuilderLevelAddedCopyWithImpl(this._self, this._then);

  final ProgressionBuilderLevelAdded _self;
  final $Res Function(ProgressionBuilderLevelAdded) _then;

/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? exerciseId = null,Object? unlockCriteria = null,}) {
  return _then(ProgressionBuilderLevelAdded(
exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,unlockCriteria: null == unlockCriteria ? _self._unlockCriteria : unlockCriteria // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

/// @nodoc


class ProgressionBuilderLevelsReordered implements ProgressionBuilderEvent {
  const ProgressionBuilderLevelsReordered(this.oldIndex, this.newIndex);
  

 final  int oldIndex;
 final  int newIndex;

/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionBuilderLevelsReorderedCopyWith<ProgressionBuilderLevelsReordered> get copyWith => _$ProgressionBuilderLevelsReorderedCopyWithImpl<ProgressionBuilderLevelsReordered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionBuilderLevelsReordered&&(identical(other.oldIndex, oldIndex) || other.oldIndex == oldIndex)&&(identical(other.newIndex, newIndex) || other.newIndex == newIndex));
}


@override
int get hashCode => Object.hash(runtimeType,oldIndex,newIndex);

@override
String toString() {
  return 'ProgressionBuilderEvent.levelsReordered(oldIndex: $oldIndex, newIndex: $newIndex)';
}


}

/// @nodoc
abstract mixin class $ProgressionBuilderLevelsReorderedCopyWith<$Res> implements $ProgressionBuilderEventCopyWith<$Res> {
  factory $ProgressionBuilderLevelsReorderedCopyWith(ProgressionBuilderLevelsReordered value, $Res Function(ProgressionBuilderLevelsReordered) _then) = _$ProgressionBuilderLevelsReorderedCopyWithImpl;
@useResult
$Res call({
 int oldIndex, int newIndex
});




}
/// @nodoc
class _$ProgressionBuilderLevelsReorderedCopyWithImpl<$Res>
    implements $ProgressionBuilderLevelsReorderedCopyWith<$Res> {
  _$ProgressionBuilderLevelsReorderedCopyWithImpl(this._self, this._then);

  final ProgressionBuilderLevelsReordered _self;
  final $Res Function(ProgressionBuilderLevelsReordered) _then;

/// Create a copy of ProgressionBuilderEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? oldIndex = null,Object? newIndex = null,}) {
  return _then(ProgressionBuilderLevelsReordered(
null == oldIndex ? _self.oldIndex : oldIndex // ignore: cast_nullable_to_non_nullable
as int,null == newIndex ? _self.newIndex : newIndex // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
