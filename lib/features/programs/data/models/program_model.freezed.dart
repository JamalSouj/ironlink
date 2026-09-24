// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'program_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProgramModel {

 String get id; String get coachId; String get clientId; String get name; DateTime get startDate; DateTime? get endDate; DateTime get createdAt;
/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProgramModelCopyWith<ProgramModel> get copyWith => _$ProgramModelCopyWithImpl<ProgramModel>(this as ProgramModel, _$identity);

  /// Serializes this ProgramModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProgramModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,clientId,name,startDate,endDate,createdAt);

@override
String toString() {
  return 'ProgramModel(id: $id, coachId: $coachId, clientId: $clientId, name: $name, startDate: $startDate, endDate: $endDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ProgramModelCopyWith<$Res>  {
  factory $ProgramModelCopyWith(ProgramModel value, $Res Function(ProgramModel) _then) = _$ProgramModelCopyWithImpl;
@useResult
$Res call({
 String id, String coachId, String clientId, String name, DateTime startDate, DateTime? endDate, DateTime createdAt
});




}
/// @nodoc
class _$ProgramModelCopyWithImpl<$Res>
    implements $ProgramModelCopyWith<$Res> {
  _$ProgramModelCopyWithImpl(this._self, this._then);

  final ProgramModel _self;
  final $Res Function(ProgramModel) _then;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? clientId = null,Object? name = null,Object? startDate = null,Object? endDate = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ProgramModel extends ProgramModel {
  const _ProgramModel({required this.id, required this.coachId, required this.clientId, required this.name, required this.startDate, this.endDate, required this.createdAt}): super._();
  factory _ProgramModel.fromJson(Map<String, dynamic> json) => _$ProgramModelFromJson(json);

@override final  String id;
@override final  String coachId;
@override final  String clientId;
@override final  String name;
@override final  DateTime startDate;
@override final  DateTime? endDate;
@override final  DateTime createdAt;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProgramModelCopyWith<_ProgramModel> get copyWith => __$ProgramModelCopyWithImpl<_ProgramModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProgramModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProgramModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,clientId,name,startDate,endDate,createdAt);

@override
String toString() {
  return 'ProgramModel(id: $id, coachId: $coachId, clientId: $clientId, name: $name, startDate: $startDate, endDate: $endDate, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ProgramModelCopyWith<$Res> implements $ProgramModelCopyWith<$Res> {
  factory _$ProgramModelCopyWith(_ProgramModel value, $Res Function(_ProgramModel) _then) = __$ProgramModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String coachId, String clientId, String name, DateTime startDate, DateTime? endDate, DateTime createdAt
});




}
/// @nodoc
class __$ProgramModelCopyWithImpl<$Res>
    implements _$ProgramModelCopyWith<$Res> {
  __$ProgramModelCopyWithImpl(this._self, this._then);

  final _ProgramModel _self;
  final $Res Function(_ProgramModel) _then;

/// Create a copy of ProgramModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? clientId = null,Object? name = null,Object? startDate = null,Object? endDate = freezed,Object? createdAt = null,}) {
  return _then(_ProgramModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: freezed == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
