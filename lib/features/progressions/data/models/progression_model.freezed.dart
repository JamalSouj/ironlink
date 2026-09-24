// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'progression_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgressionModel {

 String get id; String get name; String? get createdBy; DateTime? get createdAt;
/// Create a copy of ProgressionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgressionModelCopyWith<ProgressionModel> get copyWith => _$ProgressionModelCopyWithImpl<ProgressionModel>(this as ProgressionModel, _$identity);

  /// Serializes this ProgressionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgressionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdBy,createdAt);

@override
String toString() {
  return 'ProgressionModel(id: $id, name: $name, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProgressionModelCopyWith<$Res>  {
  factory $ProgressionModelCopyWith(ProgressionModel value, $Res Function(ProgressionModel) _then) = _$ProgressionModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String? createdBy, DateTime? createdAt
});




}
/// @nodoc
class _$ProgressionModelCopyWithImpl<$Res>
    implements $ProgressionModelCopyWith<$Res> {
  _$ProgressionModelCopyWithImpl(this._self, this._then);

  final ProgressionModel _self;
  final $Res Function(ProgressionModel) _then;

/// Create a copy of ProgressionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProgressionModel extends ProgressionModel {
  const _ProgressionModel({required this.id, required this.name, this.createdBy, this.createdAt}): super._();
  factory _ProgressionModel.fromJson(Map<String, dynamic> json) => _$ProgressionModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String? createdBy;
@override final  DateTime? createdAt;

/// Create a copy of ProgressionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgressionModelCopyWith<_ProgressionModel> get copyWith => __$ProgressionModelCopyWithImpl<_ProgressionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgressionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgressionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdBy, createdBy) || other.createdBy == createdBy)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,createdBy,createdAt);

@override
String toString() {
  return 'ProgressionModel(id: $id, name: $name, createdBy: $createdBy, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProgressionModelCopyWith<$Res> implements $ProgressionModelCopyWith<$Res> {
  factory _$ProgressionModelCopyWith(_ProgressionModel value, $Res Function(_ProgressionModel) _then) = __$ProgressionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String? createdBy, DateTime? createdAt
});




}
/// @nodoc
class __$ProgressionModelCopyWithImpl<$Res>
    implements _$ProgressionModelCopyWith<$Res> {
  __$ProgressionModelCopyWithImpl(this._self, this._then);

  final _ProgressionModel _self;
  final $Res Function(_ProgressionModel) _then;

/// Create a copy of ProgressionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdBy = freezed,Object? createdAt = freezed,}) {
  return _then(_ProgressionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdBy: freezed == createdBy ? _self.createdBy : createdBy // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
