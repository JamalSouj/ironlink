// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_progression_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ClientProgressionStatusModel {

 String get id; String get clientId; String get progressionId; String? get currentLevelId; DateTime? get unlockedAt;
/// Create a copy of ClientProgressionStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientProgressionStatusModelCopyWith<ClientProgressionStatusModel> get copyWith => _$ClientProgressionStatusModelCopyWithImpl<ClientProgressionStatusModel>(this as ClientProgressionStatusModel, _$identity);

  /// Serializes this ClientProgressionStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientProgressionStatusModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId)&&(identical(other.currentLevelId, currentLevelId) || other.currentLevelId == currentLevelId)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,progressionId,currentLevelId,unlockedAt);

@override
String toString() {
  return 'ClientProgressionStatusModel(id: $id, clientId: $clientId, progressionId: $progressionId, currentLevelId: $currentLevelId, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class $ClientProgressionStatusModelCopyWith<$Res>  {
  factory $ClientProgressionStatusModelCopyWith(ClientProgressionStatusModel value, $Res Function(ClientProgressionStatusModel) _then) = _$ClientProgressionStatusModelCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, String progressionId, String? currentLevelId, DateTime? unlockedAt
});




}
/// @nodoc
class _$ClientProgressionStatusModelCopyWithImpl<$Res>
    implements $ClientProgressionStatusModelCopyWith<$Res> {
  _$ClientProgressionStatusModelCopyWithImpl(this._self, this._then);

  final ClientProgressionStatusModel _self;
  final $Res Function(ClientProgressionStatusModel) _then;

/// Create a copy of ClientProgressionStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? progressionId = null,Object? currentLevelId = freezed,Object? unlockedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,progressionId: null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,currentLevelId: freezed == currentLevelId ? _self.currentLevelId : currentLevelId // ignore: cast_nullable_to_non_nullable
as String?,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ClientProgressionStatusModel extends ClientProgressionStatusModel {
  const _ClientProgressionStatusModel({required this.id, required this.clientId, required this.progressionId, this.currentLevelId, this.unlockedAt}): super._();
  factory _ClientProgressionStatusModel.fromJson(Map<String, dynamic> json) => _$ClientProgressionStatusModelFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  String progressionId;
@override final  String? currentLevelId;
@override final  DateTime? unlockedAt;

/// Create a copy of ClientProgressionStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClientProgressionStatusModelCopyWith<_ClientProgressionStatusModel> get copyWith => __$ClientProgressionStatusModelCopyWithImpl<_ClientProgressionStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClientProgressionStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClientProgressionStatusModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.progressionId, progressionId) || other.progressionId == progressionId)&&(identical(other.currentLevelId, currentLevelId) || other.currentLevelId == currentLevelId)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,progressionId,currentLevelId,unlockedAt);

@override
String toString() {
  return 'ClientProgressionStatusModel(id: $id, clientId: $clientId, progressionId: $progressionId, currentLevelId: $currentLevelId, unlockedAt: $unlockedAt)';
}


}

/// @nodoc
abstract mixin class _$ClientProgressionStatusModelCopyWith<$Res> implements $ClientProgressionStatusModelCopyWith<$Res> {
  factory _$ClientProgressionStatusModelCopyWith(_ClientProgressionStatusModel value, $Res Function(_ClientProgressionStatusModel) _then) = __$ClientProgressionStatusModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, String progressionId, String? currentLevelId, DateTime? unlockedAt
});




}
/// @nodoc
class __$ClientProgressionStatusModelCopyWithImpl<$Res>
    implements _$ClientProgressionStatusModelCopyWith<$Res> {
  __$ClientProgressionStatusModelCopyWithImpl(this._self, this._then);

  final _ClientProgressionStatusModel _self;
  final $Res Function(_ClientProgressionStatusModel) _then;

/// Create a copy of ClientProgressionStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? progressionId = null,Object? currentLevelId = freezed,Object? unlockedAt = freezed,}) {
  return _then(_ClientProgressionStatusModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,progressionId: null == progressionId ? _self.progressionId : progressionId // ignore: cast_nullable_to_non_nullable
as String,currentLevelId: freezed == currentLevelId ? _self.currentLevelId : currentLevelId // ignore: cast_nullable_to_non_nullable
as String?,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
