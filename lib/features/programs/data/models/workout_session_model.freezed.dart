// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'workout_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkoutSessionModel {

 String get id; String? get programBlockId; String get clientId; DateTime get scheduledDate; String get status; int? get sessionRpe; int? get durationMinutes;
/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkoutSessionModelCopyWith<WorkoutSessionModel> get copyWith => _$WorkoutSessionModelCopyWithImpl<WorkoutSessionModel>(this as WorkoutSessionModel, _$identity);

  /// Serializes this WorkoutSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkoutSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programBlockId, programBlockId) || other.programBlockId == programBlockId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.sessionRpe, sessionRpe) || other.sessionRpe == sessionRpe)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programBlockId,clientId,scheduledDate,status,sessionRpe,durationMinutes);

@override
String toString() {
  return 'WorkoutSessionModel(id: $id, programBlockId: $programBlockId, clientId: $clientId, scheduledDate: $scheduledDate, status: $status, sessionRpe: $sessionRpe, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class $WorkoutSessionModelCopyWith<$Res>  {
  factory $WorkoutSessionModelCopyWith(WorkoutSessionModel value, $Res Function(WorkoutSessionModel) _then) = _$WorkoutSessionModelCopyWithImpl;
@useResult
$Res call({
 String id, String? programBlockId, String clientId, DateTime scheduledDate, String status, int? sessionRpe, int? durationMinutes
});




}
/// @nodoc
class _$WorkoutSessionModelCopyWithImpl<$Res>
    implements $WorkoutSessionModelCopyWith<$Res> {
  _$WorkoutSessionModelCopyWithImpl(this._self, this._then);

  final WorkoutSessionModel _self;
  final $Res Function(WorkoutSessionModel) _then;

/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? programBlockId = freezed,Object? clientId = null,Object? scheduledDate = null,Object? status = null,Object? sessionRpe = freezed,Object? durationMinutes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programBlockId: freezed == programBlockId ? _self.programBlockId : programBlockId // ignore: cast_nullable_to_non_nullable
as String?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sessionRpe: freezed == sessionRpe ? _self.sessionRpe : sessionRpe // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _WorkoutSessionModel extends WorkoutSessionModel {
  const _WorkoutSessionModel({required this.id, this.programBlockId, required this.clientId, required this.scheduledDate, required this.status, this.sessionRpe, this.durationMinutes}): super._();
  factory _WorkoutSessionModel.fromJson(Map<String, dynamic> json) => _$WorkoutSessionModelFromJson(json);

@override final  String id;
@override final  String? programBlockId;
@override final  String clientId;
@override final  DateTime scheduledDate;
@override final  String status;
@override final  int? sessionRpe;
@override final  int? durationMinutes;

/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkoutSessionModelCopyWith<_WorkoutSessionModel> get copyWith => __$WorkoutSessionModelCopyWithImpl<_WorkoutSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkoutSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkoutSessionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.programBlockId, programBlockId) || other.programBlockId == programBlockId)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.scheduledDate, scheduledDate) || other.scheduledDate == scheduledDate)&&(identical(other.status, status) || other.status == status)&&(identical(other.sessionRpe, sessionRpe) || other.sessionRpe == sessionRpe)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,programBlockId,clientId,scheduledDate,status,sessionRpe,durationMinutes);

@override
String toString() {
  return 'WorkoutSessionModel(id: $id, programBlockId: $programBlockId, clientId: $clientId, scheduledDate: $scheduledDate, status: $status, sessionRpe: $sessionRpe, durationMinutes: $durationMinutes)';
}


}

/// @nodoc
abstract mixin class _$WorkoutSessionModelCopyWith<$Res> implements $WorkoutSessionModelCopyWith<$Res> {
  factory _$WorkoutSessionModelCopyWith(_WorkoutSessionModel value, $Res Function(_WorkoutSessionModel) _then) = __$WorkoutSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String? programBlockId, String clientId, DateTime scheduledDate, String status, int? sessionRpe, int? durationMinutes
});




}
/// @nodoc
class __$WorkoutSessionModelCopyWithImpl<$Res>
    implements _$WorkoutSessionModelCopyWith<$Res> {
  __$WorkoutSessionModelCopyWithImpl(this._self, this._then);

  final _WorkoutSessionModel _self;
  final $Res Function(_WorkoutSessionModel) _then;

/// Create a copy of WorkoutSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? programBlockId = freezed,Object? clientId = null,Object? scheduledDate = null,Object? status = null,Object? sessionRpe = freezed,Object? durationMinutes = freezed,}) {
  return _then(_WorkoutSessionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,programBlockId: freezed == programBlockId ? _self.programBlockId : programBlockId // ignore: cast_nullable_to_non_nullable
as String?,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,scheduledDate: null == scheduledDate ? _self.scheduledDate : scheduledDate // ignore: cast_nullable_to_non_nullable
as DateTime,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sessionRpe: freezed == sessionRpe ? _self.sessionRpe : sessionRpe // ignore: cast_nullable_to_non_nullable
as int?,durationMinutes: freezed == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
