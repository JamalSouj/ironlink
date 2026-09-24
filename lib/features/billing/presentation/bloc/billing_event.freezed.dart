// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BillingEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillingEvent()';
}


}

/// @nodoc
class $BillingEventCopyWith<$Res>  {
$BillingEventCopyWith(BillingEvent _, $Res Function(BillingEvent) __);
}


/// @nodoc


class BillingStarted implements BillingEvent {
  const BillingStarted({required this.coachId});
  

 final  String coachId;

/// Create a copy of BillingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingStartedCopyWith<BillingStarted> get copyWith => _$BillingStartedCopyWithImpl<BillingStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingStarted&&(identical(other.coachId, coachId) || other.coachId == coachId));
}


@override
int get hashCode => Object.hash(runtimeType,coachId);

@override
String toString() {
  return 'BillingEvent.started(coachId: $coachId)';
}


}

/// @nodoc
abstract mixin class $BillingStartedCopyWith<$Res> implements $BillingEventCopyWith<$Res> {
  factory $BillingStartedCopyWith(BillingStarted value, $Res Function(BillingStarted) _then) = _$BillingStartedCopyWithImpl;
@useResult
$Res call({
 String coachId
});




}
/// @nodoc
class _$BillingStartedCopyWithImpl<$Res>
    implements $BillingStartedCopyWith<$Res> {
  _$BillingStartedCopyWithImpl(this._self, this._then);

  final BillingStarted _self;
  final $Res Function(BillingStarted) _then;

/// Create a copy of BillingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? coachId = null,}) {
  return _then(BillingStarted(
coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillingCheckoutRequested implements BillingEvent {
  const BillingCheckoutRequested({required this.priceId, required this.redirectUrl});
  

 final  String priceId;
 final  String redirectUrl;

/// Create a copy of BillingEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingCheckoutRequestedCopyWith<BillingCheckoutRequested> get copyWith => _$BillingCheckoutRequestedCopyWithImpl<BillingCheckoutRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingCheckoutRequested&&(identical(other.priceId, priceId) || other.priceId == priceId)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}


@override
int get hashCode => Object.hash(runtimeType,priceId,redirectUrl);

@override
String toString() {
  return 'BillingEvent.checkoutRequested(priceId: $priceId, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class $BillingCheckoutRequestedCopyWith<$Res> implements $BillingEventCopyWith<$Res> {
  factory $BillingCheckoutRequestedCopyWith(BillingCheckoutRequested value, $Res Function(BillingCheckoutRequested) _then) = _$BillingCheckoutRequestedCopyWithImpl;
@useResult
$Res call({
 String priceId, String redirectUrl
});




}
/// @nodoc
class _$BillingCheckoutRequestedCopyWithImpl<$Res>
    implements $BillingCheckoutRequestedCopyWith<$Res> {
  _$BillingCheckoutRequestedCopyWithImpl(this._self, this._then);

  final BillingCheckoutRequested _self;
  final $Res Function(BillingCheckoutRequested) _then;

/// Create a copy of BillingEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? priceId = null,Object? redirectUrl = null,}) {
  return _then(BillingCheckoutRequested(
priceId: null == priceId ? _self.priceId : priceId // ignore: cast_nullable_to_non_nullable
as String,redirectUrl: null == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
