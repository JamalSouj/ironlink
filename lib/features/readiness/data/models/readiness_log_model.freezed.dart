// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'readiness_log_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReadinessLogModel {

 String get id; String get clientId; DateTime get logDate; int get sleepQuality; int get soreness; int get stress; double get readinessScore;
/// Create a copy of ReadinessLogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadinessLogModelCopyWith<ReadinessLogModel> get copyWith => _$ReadinessLogModelCopyWithImpl<ReadinessLogModel>(this as ReadinessLogModel, _$identity);

  /// Serializes this ReadinessLogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadinessLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.sleepQuality, sleepQuality) || other.sleepQuality == sleepQuality)&&(identical(other.soreness, soreness) || other.soreness == soreness)&&(identical(other.stress, stress) || other.stress == stress)&&(identical(other.readinessScore, readinessScore) || other.readinessScore == readinessScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,logDate,sleepQuality,soreness,stress,readinessScore);

@override
String toString() {
  return 'ReadinessLogModel(id: $id, clientId: $clientId, logDate: $logDate, sleepQuality: $sleepQuality, soreness: $soreness, stress: $stress, readinessScore: $readinessScore)';
}


}

/// @nodoc
abstract mixin class $ReadinessLogModelCopyWith<$Res>  {
  factory $ReadinessLogModelCopyWith(ReadinessLogModel value, $Res Function(ReadinessLogModel) _then) = _$ReadinessLogModelCopyWithImpl;
@useResult
$Res call({
 String id, String clientId, DateTime logDate, int sleepQuality, int soreness, int stress, double readinessScore
});




}
/// @nodoc
class _$ReadinessLogModelCopyWithImpl<$Res>
    implements $ReadinessLogModelCopyWith<$Res> {
  _$ReadinessLogModelCopyWithImpl(this._self, this._then);

  final ReadinessLogModel _self;
  final $Res Function(ReadinessLogModel) _then;

/// Create a copy of ReadinessLogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? clientId = null,Object? logDate = null,Object? sleepQuality = null,Object? soreness = null,Object? stress = null,Object? readinessScore = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,sleepQuality: null == sleepQuality ? _self.sleepQuality : sleepQuality // ignore: cast_nullable_to_non_nullable
as int,soreness: null == soreness ? _self.soreness : soreness // ignore: cast_nullable_to_non_nullable
as int,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as int,readinessScore: null == readinessScore ? _self.readinessScore : readinessScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ReadinessLogModel extends ReadinessLogModel {
  const _ReadinessLogModel({required this.id, required this.clientId, required this.logDate, required this.sleepQuality, required this.soreness, required this.stress, required this.readinessScore}): super._();
  factory _ReadinessLogModel.fromJson(Map<String, dynamic> json) => _$ReadinessLogModelFromJson(json);

@override final  String id;
@override final  String clientId;
@override final  DateTime logDate;
@override final  int sleepQuality;
@override final  int soreness;
@override final  int stress;
@override final  double readinessScore;

/// Create a copy of ReadinessLogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadinessLogModelCopyWith<_ReadinessLogModel> get copyWith => __$ReadinessLogModelCopyWithImpl<_ReadinessLogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadinessLogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadinessLogModel&&(identical(other.id, id) || other.id == id)&&(identical(other.clientId, clientId) || other.clientId == clientId)&&(identical(other.logDate, logDate) || other.logDate == logDate)&&(identical(other.sleepQuality, sleepQuality) || other.sleepQuality == sleepQuality)&&(identical(other.soreness, soreness) || other.soreness == soreness)&&(identical(other.stress, stress) || other.stress == stress)&&(identical(other.readinessScore, readinessScore) || other.readinessScore == readinessScore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,clientId,logDate,sleepQuality,soreness,stress,readinessScore);

@override
String toString() {
  return 'ReadinessLogModel(id: $id, clientId: $clientId, logDate: $logDate, sleepQuality: $sleepQuality, soreness: $soreness, stress: $stress, readinessScore: $readinessScore)';
}


}

/// @nodoc
abstract mixin class _$ReadinessLogModelCopyWith<$Res> implements $ReadinessLogModelCopyWith<$Res> {
  factory _$ReadinessLogModelCopyWith(_ReadinessLogModel value, $Res Function(_ReadinessLogModel) _then) = __$ReadinessLogModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String clientId, DateTime logDate, int sleepQuality, int soreness, int stress, double readinessScore
});




}
/// @nodoc
class __$ReadinessLogModelCopyWithImpl<$Res>
    implements _$ReadinessLogModelCopyWith<$Res> {
  __$ReadinessLogModelCopyWithImpl(this._self, this._then);

  final _ReadinessLogModel _self;
  final $Res Function(_ReadinessLogModel) _then;

/// Create a copy of ReadinessLogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? clientId = null,Object? logDate = null,Object? sleepQuality = null,Object? soreness = null,Object? stress = null,Object? readinessScore = null,}) {
  return _then(_ReadinessLogModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,logDate: null == logDate ? _self.logDate : logDate // ignore: cast_nullable_to_non_nullable
as DateTime,sleepQuality: null == sleepQuality ? _self.sleepQuality : sleepQuality // ignore: cast_nullable_to_non_nullable
as int,soreness: null == soreness ? _self.soreness : soreness // ignore: cast_nullable_to_non_nullable
as int,stress: null == stress ? _self.stress : stress // ignore: cast_nullable_to_non_nullable
as int,readinessScore: null == readinessScore ? _self.readinessScore : readinessScore // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
