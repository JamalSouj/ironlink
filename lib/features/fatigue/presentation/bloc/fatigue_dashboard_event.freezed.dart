// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fatigue_dashboard_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$FatigueDashboardEvent {

 String get clientId;
/// Create a copy of FatigueDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FatigueDashboardEventCopyWith<FatigueDashboardEvent> get copyWith => _$FatigueDashboardEventCopyWithImpl<FatigueDashboardEvent>(this as FatigueDashboardEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardEvent&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'FatigueDashboardEvent(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $FatigueDashboardEventCopyWith<$Res>  {
  factory $FatigueDashboardEventCopyWith(FatigueDashboardEvent value, $Res Function(FatigueDashboardEvent) _then) = _$FatigueDashboardEventCopyWithImpl;
@useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$FatigueDashboardEventCopyWithImpl<$Res>
    implements $FatigueDashboardEventCopyWith<$Res> {
  _$FatigueDashboardEventCopyWithImpl(this._self, this._then);

  final FatigueDashboardEvent _self;
  final $Res Function(FatigueDashboardEvent) _then;

/// Create a copy of FatigueDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientId = null,}) {
  return _then(_self.copyWith(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class FatigueDashboardStarted implements FatigueDashboardEvent {
  const FatigueDashboardStarted({required this.clientId});
  

@override final  String clientId;

/// Create a copy of FatigueDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FatigueDashboardStartedCopyWith<FatigueDashboardStarted> get copyWith => _$FatigueDashboardStartedCopyWithImpl<FatigueDashboardStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FatigueDashboardStarted&&(identical(other.clientId, clientId) || other.clientId == clientId));
}


@override
int get hashCode => Object.hash(runtimeType,clientId);

@override
String toString() {
  return 'FatigueDashboardEvent.started(clientId: $clientId)';
}


}

/// @nodoc
abstract mixin class $FatigueDashboardStartedCopyWith<$Res> implements $FatigueDashboardEventCopyWith<$Res> {
  factory $FatigueDashboardStartedCopyWith(FatigueDashboardStarted value, $Res Function(FatigueDashboardStarted) _then) = _$FatigueDashboardStartedCopyWithImpl;
@override @useResult
$Res call({
 String clientId
});




}
/// @nodoc
class _$FatigueDashboardStartedCopyWithImpl<$Res>
    implements $FatigueDashboardStartedCopyWith<$Res> {
  _$FatigueDashboardStartedCopyWithImpl(this._self, this._then);

  final FatigueDashboardStarted _self;
  final $Res Function(FatigueDashboardStarted) _then;

/// Create a copy of FatigueDashboardEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientId = null,}) {
  return _then(FatigueDashboardStarted(
clientId: null == clientId ? _self.clientId : clientId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
