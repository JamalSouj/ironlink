// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_client_relationship_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachClientRelationshipModel {

 String get id; String get coachId; String get clientId; String get status; DateTime get createdAt;
/// Create a copy of CoachClientRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachClientRelationshipModelCopyWith<CoachClientRelationshipModel> get copyWith => _$CoachClientRelationshipModelCopyWithImpl<CoachClientRelationshipModel>(this as CoachClientRelationshipModel, _$identity);

  /// Serializes this CoachClientRelationshipModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachClientRelationshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,clientId,status,createdAt);

@override
String toString() {
  return 'CoachClientRelationshipModel(id: $id, coachId: $coachId, clientId: $clientId, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CoachClientRelationshipModelCopyWith<$Res>  {
  factory $CoachClientRelationshipModelCopyWith(CoachClientRelationshipModel value, $Res Function(CoachClientRelationshipModel) _then) = _$CoachClientRelationshipModelCopyWithImpl;
@useResult
$Res call({
 String id, String coachId, String clientId, String status, DateTime createdAt
});




}
/// @nodoc
class _$CoachClientRelationshipModelCopyWithImpl<$Res>
    implements $CoachClientRelationshipModelCopyWith<$Res> {
  _$CoachClientRelationshipModelCopyWithImpl(this._self, this._then);

  final CoachClientRelationshipModel _self;
  final $Res Function(CoachClientRelationshipModel) _then;

/// Create a copy of CoachClientRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? clientId = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CoachClientRelationshipModel extends CoachClientRelationshipModel {
  const _CoachClientRelationshipModel({required this.id, required this.coachId, required this.clientId, required this.status, required this.createdAt}): super._();
  factory _CoachClientRelationshipModel.fromJson(Map<String, dynamic> json) => _$CoachClientRelationshipModelFromJson(json);

@override final  String id;
@override final  String coachId;
@override final  String clientId;
@override final  String status;
@override final  DateTime createdAt;

/// Create a copy of CoachClientRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachClientRelationshipModelCopyWith<_CoachClientRelationshipModel> get copyWith => __$CoachClientRelationshipModelCopyWithImpl<_CoachClientRelationshipModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachClientRelationshipModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachClientRelationshipModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,clientId,status,createdAt);

@override
String toString() {
  return 'CoachClientRelationshipModel(id: $id, coachId: $coachId, clientId: $clientId, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CoachClientRelationshipModelCopyWith<$Res> implements $CoachClientRelationshipModelCopyWith<$Res> {
  factory _$CoachClientRelationshipModelCopyWith(_CoachClientRelationshipModel value, $Res Function(_CoachClientRelationshipModel) _then) = __$CoachClientRelationshipModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String coachId, String clientId, String status, DateTime createdAt
});




}
/// @nodoc
class __$CoachClientRelationshipModelCopyWithImpl<$Res>
    implements _$CoachClientRelationshipModelCopyWith<$Res> {
  __$CoachClientRelationshipModelCopyWithImpl(this._self, this._then);

  final _CoachClientRelationshipModel _self;
  final $Res Function(_CoachClientRelationshipModel) _then;

/// Create a copy of CoachClientRelationshipModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? clientId = null,Object? status = null,Object? createdAt = null,}) {
  return _then(_CoachClientRelationshipModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
