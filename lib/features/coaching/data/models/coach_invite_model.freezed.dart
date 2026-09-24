// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_invite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachInviteModel {

 String get id; String get coachId; String get inviteCode; String get status; DateTime? get createdAt;
/// Create a copy of CoachInviteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachInviteModelCopyWith<CoachInviteModel> get copyWith => _$CoachInviteModelCopyWithImpl<CoachInviteModel>(this as CoachInviteModel, _$identity);

  /// Serializes this CoachInviteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachInviteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,inviteCode,status,createdAt);

@override
String toString() {
  return 'CoachInviteModel(id: $id, coachId: $coachId, inviteCode: $inviteCode, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CoachInviteModelCopyWith<$Res>  {
  factory $CoachInviteModelCopyWith(CoachInviteModel value, $Res Function(CoachInviteModel) _then) = _$CoachInviteModelCopyWithImpl;
@useResult
$Res call({
 String id, String coachId, String inviteCode, String status, DateTime? createdAt
});




}
/// @nodoc
class _$CoachInviteModelCopyWithImpl<$Res>
    implements $CoachInviteModelCopyWith<$Res> {
  _$CoachInviteModelCopyWithImpl(this._self, this._then);

  final CoachInviteModel _self;
  final $Res Function(CoachInviteModel) _then;

/// Create a copy of CoachInviteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? inviteCode = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _CoachInviteModel extends CoachInviteModel {
  const _CoachInviteModel({required this.id, required this.coachId, required this.inviteCode, required this.status, this.createdAt}): super._();
  factory _CoachInviteModel.fromJson(Map<String, dynamic> json) => _$CoachInviteModelFromJson(json);

@override final  String id;
@override final  String coachId;
@override final  String inviteCode;
@override final  String status;
@override final  DateTime? createdAt;

/// Create a copy of CoachInviteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachInviteModelCopyWith<_CoachInviteModel> get copyWith => __$CoachInviteModelCopyWithImpl<_CoachInviteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachInviteModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachInviteModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,inviteCode,status,createdAt);

@override
String toString() {
  return 'CoachInviteModel(id: $id, coachId: $coachId, inviteCode: $inviteCode, status: $status, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CoachInviteModelCopyWith<$Res> implements $CoachInviteModelCopyWith<$Res> {
  factory _$CoachInviteModelCopyWith(_CoachInviteModel value, $Res Function(_CoachInviteModel) _then) = __$CoachInviteModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String coachId, String inviteCode, String status, DateTime? createdAt
});




}
/// @nodoc
class __$CoachInviteModelCopyWithImpl<$Res>
    implements _$CoachInviteModelCopyWith<$Res> {
  __$CoachInviteModelCopyWithImpl(this._self, this._then);

  final _CoachInviteModel _self;
  final $Res Function(_CoachInviteModel) _then;

/// Create a copy of CoachInviteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? inviteCode = null,Object? status = null,Object? createdAt = freezed,}) {
  return _then(_CoachInviteModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
