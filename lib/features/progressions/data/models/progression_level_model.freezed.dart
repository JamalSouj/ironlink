// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_level_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressionLevelModel {

 String get id; String get progressionId; String get exerciseId; int get levelOrder; Map<String, dynamic> get unlockCriteria;
/// Create a copy of ProgressionLevelModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionLevelModelCopyWith<ProgressionLevelModel> get copyWith => _$ProgressionLevelModelCopyWithImpl<ProgressionLevelModel>(this as ProgressionLevelModel, _$identity);

  /// Serializes this ProgressionLevelModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionLevelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.levelOrder, levelOrder) || other.levelOrder == levelOrder)&&const DeepCollectionEquality().equals(other.unlockCriteria, unlockCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,progressionId,exerciseId,levelOrder,const DeepCollectionEquality().hash(unlockCriteria));

@override
String toString() {
  return 'ProgressionLevelModel(id: $id, progressionId: $progressionId, exerciseId: $exerciseId, levelOrder: $levelOrder, unlockCriteria: $unlockCriteria)';
}


}

/// @nodoc
abstract mixin class $ProgressionLevelModelCopyWith<$Res>  {
  factory $ProgressionLevelModelCopyWith(ProgressionLevelModel value, $Res Function(ProgressionLevelModel) _then) = _$ProgressionLevelModelCopyWithImpl;
@useResult
$Res call({
 String id, String progressionId, String exerciseId, int levelOrder, Map<String, dynamic> unlockCriteria
});




}
/// @nodoc
class _$ProgressionLevelModelCopyWithImpl<$Res>
    implements $ProgressionLevelModelCopyWith<$Res> {
  _$ProgressionLevelModelCopyWithImpl(this._self, this._then);

  final ProgressionLevelModel _self;
  final $Res Function(ProgressionLevelModel) _then;

/// Create a copy of ProgressionLevelModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? progressionId = null,Object? exerciseId = null,Object? levelOrder = null,Object? unlockCriteria = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,progressionId: null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,levelOrder: null == levelOrder ? _self.levelOrder : levelOrder // ignore: cast_nullable_to_non_nullable
as int,unlockCriteria: null == unlockCriteria ? _self.unlockCriteria : unlockCriteria // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProgressionLevelModel extends ProgressionLevelModel {
  const _ProgressionLevelModel({required this.id, required this.progressionId, required this.exerciseId, required this.levelOrder, required final  Map<String, dynamic> unlockCriteria}): _unlockCriteria = unlockCriteria,super._();
  factory _ProgressionLevelModel.fromJson(Map<String, dynamic> json) => _$ProgressionLevelModelFromJson(json);

@override final  String id;
@override final  String progressionId;
@override final  String exerciseId;
@override final  int levelOrder;
 final  Map<String, dynamic> _unlockCriteria;
@override Map<String, dynamic> get unlockCriteria {
  if (_unlockCriteria is EqualUnmodifiableMapView) return _unlockCriteria;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_unlockCriteria);
}


/// Create a copy of ProgressionLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressionLevelModelCopyWith<_ProgressionLevelModel> get copyWith => __$ProgressionLevelModelCopyWithImpl<_ProgressionLevelModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressionLevelModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressionLevelModel&&(identical(other.id, id) || other.id == id)&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.levelOrder, levelOrder) || other.levelOrder == levelOrder)&&const DeepCollectionEquality().equals(other._unlockCriteria, _unlockCriteria));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,progressionId,exerciseId,levelOrder,const DeepCollectionEquality().hash(_unlockCriteria));

@override
String toString() {
  return 'ProgressionLevelModel(id: $id, progressionId: $progressionId, exerciseId: $exerciseId, levelOrder: $levelOrder, unlockCriteria: $unlockCriteria)';
}


}

/// @nodoc
abstract mixin class _$ProgressionLevelModelCopyWith<$Res> implements $ProgressionLevelModelCopyWith<$Res> {
  factory _$ProgressionLevelModelCopyWith(_ProgressionLevelModel value, $Res Function(_ProgressionLevelModel) _then) = __$ProgressionLevelModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String progressionId, String exerciseId, int levelOrder, Map<String, dynamic> unlockCriteria
});




}
/// @nodoc
class __$ProgressionLevelModelCopyWithImpl<$Res>
    implements _$ProgressionLevelModelCopyWith<$Res> {
  __$ProgressionLevelModelCopyWithImpl(this._self, this._then);

  final _ProgressionLevelModel _self;
  final $Res Function(_ProgressionLevelModel) _then;

/// Create a copy of ProgressionLevelModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? progressionId = null,Object? exerciseId = null,Object? levelOrder = null,Object? unlockCriteria = null,}) {
  return _then(_ProgressionLevelModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,progressionId: null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,levelOrder: null == levelOrder ? _self.levelOrder : levelOrder // ignore: cast_nullable_to_non_nullable
as int,unlockCriteria: null == unlockCriteria ? _self._unlockCriteria : unlockCriteria // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,
  ));
}


}

// dart format on
