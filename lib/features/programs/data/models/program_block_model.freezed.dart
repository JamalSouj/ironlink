// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_block_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramBlockModel {

 String get id; String get programId; String get name; int get blockOrder; String? get focus;
/// Create a copy of ProgramBlockModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramBlockModelCopyWith<ProgramBlockModel> get copyWith => _$ProgramBlockModelCopyWithImpl<ProgramBlockModel>(this as ProgramBlockModel, _$identity);

  /// Serializes this ProgramBlockModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramBlockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.name, name) || other.name == name)&&(identical(other.blockOrder, blockOrder) || other.blockOrder == blockOrder)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programId,name,blockOrder,focus);

@override
String toString() {
  return 'ProgramBlockModel(id: $id, programId: $programId, name: $name, blockOrder: $blockOrder, focus: $focus)';
}


}

/// @nodoc
abstract mixin class $ProgramBlockModelCopyWith<$Res>  {
  factory $ProgramBlockModelCopyWith(ProgramBlockModel value, $Res Function(ProgramBlockModel) _then) = _$ProgramBlockModelCopyWithImpl;
@useResult
$Res call({
 String id, String programId, String name, int blockOrder, String? focus
});




}
/// @nodoc
class _$ProgramBlockModelCopyWithImpl<$Res>
    implements $ProgramBlockModelCopyWith<$Res> {
  _$ProgramBlockModelCopyWithImpl(this._self, this._then);

  final ProgramBlockModel _self;
  final $Res Function(ProgramBlockModel) _then;

/// Create a copy of ProgramBlockModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? programId = null,Object? name = null,Object? blockOrder = null,Object? focus = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockOrder: null == blockOrder ? _self.blockOrder : blockOrder // ignore: cast_nullable_to_non_nullable
as int,focus: freezed == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProgramBlockModel extends ProgramBlockModel {
  const _ProgramBlockModel({required this.id, required this.programId, required this.name, required this.blockOrder, this.focus}): super._();
  factory _ProgramBlockModel.fromJson(Map<String, dynamic> json) => _$ProgramBlockModelFromJson(json);

@override final  String id;
@override final  String programId;
@override final  String name;
@override final  int blockOrder;
@override final  String? focus;

/// Create a copy of ProgramBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramBlockModelCopyWith<_ProgramBlockModel> get copyWith => __$ProgramBlockModelCopyWithImpl<_ProgramBlockModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramBlockModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramBlockModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programId, programId) || other.programId == programId)&&(identical(other.name, name) || other.name == name)&&(identical(other.blockOrder, blockOrder) || other.blockOrder == blockOrder)&&(identical(other.focus, focus) || other.focus == focus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programId,name,blockOrder,focus);

@override
String toString() {
  return 'ProgramBlockModel(id: $id, programId: $programId, name: $name, blockOrder: $blockOrder, focus: $focus)';
}


}

/// @nodoc
abstract mixin class _$ProgramBlockModelCopyWith<$Res> implements $ProgramBlockModelCopyWith<$Res> {
  factory _$ProgramBlockModelCopyWith(_ProgramBlockModel value, $Res Function(_ProgramBlockModel) _then) = __$ProgramBlockModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String programId, String name, int blockOrder, String? focus
});




}
/// @nodoc
class __$ProgramBlockModelCopyWithImpl<$Res>
    implements _$ProgramBlockModelCopyWith<$Res> {
  __$ProgramBlockModelCopyWithImpl(this._self, this._then);

  final _ProgramBlockModel _self;
  final $Res Function(_ProgramBlockModel) _then;

/// Create a copy of ProgramBlockModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? programId = null,Object? name = null,Object? blockOrder = null,Object? focus = freezed,}) {
  return _then(_ProgramBlockModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programId: null == programId ? _self.programId : programId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blockOrder: null == blockOrder ? _self.blockOrder : blockOrder // ignore: cast_nullable_to_non_nullable
as int,focus: freezed == focus ? _self.focus : focus // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
