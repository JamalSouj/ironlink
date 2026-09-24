// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SetLogModel {

 String get id; String get workoutSessionId; String get exerciseId; int get setOrder; int? get prescribedReps; double? get prescribedLoadKg; double? get prescribedPct1Rm; int? get actualReps; double? get actualLoadKg; double? get actualRpe; String? get tempo; DateTime? get completedAt;
/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetLogModelCopyWith<SetLogModel> get copyWith => _$SetLogModelCopyWithImpl<SetLogModel>(this as SetLogModel, _$identity);

  /// Serializes this SetLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutSessionId, workoutSessionId) || other.workoutSessionId == workoutSessionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.prescribedReps, prescribedReps) || other.prescribedReps == prescribedReps)&&(identical(other.prescribedLoadKg, prescribedLoadKg) || other.prescribedLoadKg == prescribedLoadKg)&&(identical(other.prescribedPct1Rm, prescribedPct1Rm) || other.prescribedPct1Rm == prescribedPct1Rm)&&(identical(other.actualReps, actualReps) || other.actualReps == actualReps)&&(identical(other.actualLoadKg, actualLoadKg) || other.actualLoadKg == actualLoadKg)&&(identical(other.actualRpe, actualRpe) || other.actualRpe == actualRpe)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workoutSessionId,exerciseId,setOrder,prescribedReps,prescribedLoadKg,prescribedPct1Rm,actualReps,actualLoadKg,actualRpe,tempo,completedAt);

@override
String toString() {
  return 'SetLogModel(id: $id, workoutSessionId: $workoutSessionId, exerciseId: $exerciseId, setOrder: $setOrder, prescribedReps: $prescribedReps, prescribedLoadKg: $prescribedLoadKg, prescribedPct1Rm: $prescribedPct1Rm, actualReps: $actualReps, actualLoadKg: $actualLoadKg, actualRpe: $actualRpe, tempo: $tempo, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $SetLogModelCopyWith<$Res>  {
  factory $SetLogModelCopyWith(SetLogModel value, $Res Function(SetLogModel) _then) = _$SetLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String workoutSessionId, String exerciseId, int setOrder, int? prescribedReps, double? prescribedLoadKg, double? prescribedPct1Rm, int? actualReps, double? actualLoadKg, double? actualRpe, String? tempo, DateTime? completedAt
});




}
/// @nodoc
class _$SetLogModelCopyWithImpl<$Res>
    implements $SetLogModelCopyWith<$Res> {
  _$SetLogModelCopyWithImpl(this._self, this._then);

  final SetLogModel _self;
  final $Res Function(SetLogModel) _then;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? workoutSessionId = null,Object? exerciseId = null,Object? setOrder = null,Object? prescribedReps = freezed,Object? prescribedLoadKg = freezed,Object? prescribedPct1Rm = freezed,Object? actualReps = freezed,Object? actualLoadKg = freezed,Object? actualRpe = freezed,Object? tempo = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutSessionId: null == workoutSessionId ? _self.workoutSessionId : workoutSessionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,prescribedReps: freezed == prescribedReps ? _self.prescribedReps : prescribedReps // ignore: cast_nullable_to_non_nullable
as int?,prescribedLoadKg: freezed == prescribedLoadKg ? _self.prescribedLoadKg : prescribedLoadKg // ignore: cast_nullable_to_non_nullable
as double?,prescribedPct1Rm: freezed == prescribedPct1Rm ? _self.prescribedPct1Rm : prescribedPct1Rm // ignore: cast_nullable_to_non_nullable
as double?,actualReps: freezed == actualReps ? _self.actualReps : actualReps // ignore: cast_nullable_to_non_nullable
as int?,actualLoadKg: freezed == actualLoadKg ? _self.actualLoadKg : actualLoadKg // ignore: cast_nullable_to_non_nullable
as double?,actualRpe: freezed == actualRpe ? _self.actualRpe : actualRpe // ignore: cast_nullable_to_non_nullable
as double?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SetLogModel extends SetLogModel {
  const _SetLogModel({required this.id, required this.workoutSessionId, required this.exerciseId, required this.setOrder, this.prescribedReps, this.prescribedLoadKg, this.prescribedPct1Rm, this.actualReps, this.actualLoadKg, this.actualRpe, this.tempo, this.completedAt}): super._();
  factory _SetLogModel.fromJson(Map<String, dynamic> json) => _$SetLogModelFromJson(json);

@override final  String id;
@override final  String workoutSessionId;
@override final  String exerciseId;
@override final  int setOrder;
@override final  int? prescribedReps;
@override final  double? prescribedLoadKg;
@override final  double? prescribedPct1Rm;
@override final  int? actualReps;
@override final  double? actualLoadKg;
@override final  double? actualRpe;
@override final  String? tempo;
@override final  DateTime? completedAt;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetLogModelCopyWith<_SetLogModel> get copyWith => __$SetLogModelCopyWithImpl<_SetLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.workoutSessionId, workoutSessionId) || other.workoutSessionId == workoutSessionId)&&(identical(other.exerciseId, exerciseId) || other.exerciseId == exerciseId)&&(identical(other.setOrder, setOrder) || other.setOrder == setOrder)&&(identical(other.prescribedReps, prescribedReps) || other.prescribedReps == prescribedReps)&&(identical(other.prescribedLoadKg, prescribedLoadKg) || other.prescribedLoadKg == prescribedLoadKg)&&(identical(other.prescribedPct1Rm, prescribedPct1Rm) || other.prescribedPct1Rm == prescribedPct1Rm)&&(identical(other.actualReps, actualReps) || other.actualReps == actualReps)&&(identical(other.actualLoadKg, actualLoadKg) || other.actualLoadKg == actualLoadKg)&&(identical(other.actualRpe, actualRpe) || other.actualRpe == actualRpe)&&(identical(other.tempo, tempo) || other.tempo == tempo)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,workoutSessionId,exerciseId,setOrder,prescribedReps,prescribedLoadKg,prescribedPct1Rm,actualReps,actualLoadKg,actualRpe,tempo,completedAt);

@override
String toString() {
  return 'SetLogModel(id: $id, workoutSessionId: $workoutSessionId, exerciseId: $exerciseId, setOrder: $setOrder, prescribedReps: $prescribedReps, prescribedLoadKg: $prescribedLoadKg, prescribedPct1Rm: $prescribedPct1Rm, actualReps: $actualReps, actualLoadKg: $actualLoadKg, actualRpe: $actualRpe, tempo: $tempo, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$SetLogModelCopyWith<$Res> implements $SetLogModelCopyWith<$Res> {
  factory _$SetLogModelCopyWith(_SetLogModel value, $Res Function(_SetLogModel) _then) = __$SetLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String workoutSessionId, String exerciseId, int setOrder, int? prescribedReps, double? prescribedLoadKg, double? prescribedPct1Rm, int? actualReps, double? actualLoadKg, double? actualRpe, String? tempo, DateTime? completedAt
});




}
/// @nodoc
class __$SetLogModelCopyWithImpl<$Res>
    implements _$SetLogModelCopyWith<$Res> {
  __$SetLogModelCopyWithImpl(this._self, this._then);

  final _SetLogModel _self;
  final $Res Function(_SetLogModel) _then;

/// Create a copy of SetLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? workoutSessionId = null,Object? exerciseId = null,Object? setOrder = null,Object? prescribedReps = freezed,Object? prescribedLoadKg = freezed,Object? prescribedPct1Rm = freezed,Object? actualReps = freezed,Object? actualLoadKg = freezed,Object? actualRpe = freezed,Object? tempo = freezed,Object? completedAt = freezed,}) {
  return _then(_SetLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,workoutSessionId: null == workoutSessionId ? _self.workoutSessionId : workoutSessionId // ignore: cast_nullable_to_non_nullable
as String,exerciseId: null == exerciseId ? _self.exerciseId : exerciseId // ignore: cast_nullable_to_non_nullable
as String,setOrder: null == setOrder ? _self.setOrder : setOrder // ignore: cast_nullable_to_non_nullable
as int,prescribedReps: freezed == prescribedReps ? _self.prescribedReps : prescribedReps // ignore: cast_nullable_to_non_nullable
as int?,prescribedLoadKg: freezed == prescribedLoadKg ? _self.prescribedLoadKg : prescribedLoadKg // ignore: cast_nullable_to_non_nullable
as double?,prescribedPct1Rm: freezed == prescribedPct1Rm ? _self.prescribedPct1Rm : prescribedPct1Rm // ignore: cast_nullable_to_non_nullable
as double?,actualReps: freezed == actualReps ? _self.actualReps : actualReps // ignore: cast_nullable_to_non_nullable
as int?,actualLoadKg: freezed == actualLoadKg ? _self.actualLoadKg : actualLoadKg // ignore: cast_nullable_to_non_nullable
as double?,actualRpe: freezed == actualRpe ? _self.actualRpe : actualRpe // ignore: cast_nullable_to_non_nullable
as double?,tempo: freezed == tempo ? _self.tempo : tempo // ignore: cast_nullable_to_non_nullable
as String?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
