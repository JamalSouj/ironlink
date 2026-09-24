// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubscriptionModel {

 String get id; String get coachId; String get plan; String get status; DateTime? get currentPeriodEnd;
/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<SubscriptionModel> get copyWith => _$SubscriptionModelCopyWithImpl<SubscriptionModel>(this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,plan,status,currentPeriodEnd);

@override
String toString() {
  return 'SubscriptionModel(id: $id, coachId: $coachId, plan: $plan, status: $status, currentPeriodEnd: $currentPeriodEnd)';
}


}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res>  {
  factory $SubscriptionModelCopyWith(SubscriptionModel value, $Res Function(SubscriptionModel) _then) = _$SubscriptionModelCopyWithImpl;
@useResult
$Res call({
 String id, String coachId, String plan, String status, DateTime? currentPeriodEnd
});




}
/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? plan = null,Object? status = null,Object? currentPeriodEnd = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _SubscriptionModel extends SubscriptionModel {
  const _SubscriptionModel({required this.id, required this.coachId, required this.plan, required this.status, this.currentPeriodEnd}): super._();
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

@override final  String id;
@override final  String coachId;
@override final  String plan;
@override final  String status;
@override final  DateTime? currentPeriodEnd;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith => __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.status, status) || other.status == status)&&(identical(other.currentPeriodEnd, currentPeriodEnd) || other.currentPeriodEnd == currentPeriodEnd));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,plan,status,currentPeriodEnd);

@override
String toString() {
  return 'SubscriptionModel(id: $id, coachId: $coachId, plan: $plan, status: $status, currentPeriodEnd: $currentPeriodEnd)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res> implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(_SubscriptionModel value, $Res Function(_SubscriptionModel) _then) = __$SubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String coachId, String plan, String status, DateTime? currentPeriodEnd
});




}
/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? plan = null,Object? status = null,Object? currentPeriodEnd = freezed,}) {
  return _then(_SubscriptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,plan: null == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,currentPeriodEnd: freezed == currentPeriodEnd ? _self.currentPeriodEnd : currentPeriodEnd // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
