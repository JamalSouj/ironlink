// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'billing_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BillingState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillingState()';
}


}

/// @nodoc
class $BillingStateCopyWith<$Res>  {
$BillingStateCopyWith(BillingState _, $Res Function(BillingState) __);
}


/// @nodoc


class BillingInitial implements BillingState {
  const BillingInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillingState.initial()';
}


}




/// @nodoc


class BillingLoading implements BillingState {
  const BillingLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillingState.loading()';
}


}




/// @nodoc


class BillingLoaded implements BillingState {
  const BillingLoaded({required this.subscription});
  

 final  Subscription? subscription;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingLoadedCopyWith<BillingLoaded> get copyWith => _$BillingLoadedCopyWithImpl<BillingLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingLoaded&&(identical(other.subscription, subscription) || other.subscription == subscription));
}


@override
int get hashCode => Object.hash(runtimeType,subscription);

@override
String toString() {
  return 'BillingState.loaded(subscription: $subscription)';
}


}

/// @nodoc
abstract mixin class $BillingLoadedCopyWith<$Res> implements $BillingStateCopyWith<$Res> {
  factory $BillingLoadedCopyWith(BillingLoaded value, $Res Function(BillingLoaded) _then) = _$BillingLoadedCopyWithImpl;
@useResult
$Res call({
 Subscription? subscription
});




}
/// @nodoc
class _$BillingLoadedCopyWithImpl<$Res>
    implements $BillingLoadedCopyWith<$Res> {
  _$BillingLoadedCopyWithImpl(this._self, this._then);

  final BillingLoaded _self;
  final $Res Function(BillingLoaded) _then;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? subscription = freezed,}) {
  return _then(BillingLoaded(
subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as Subscription?,
  ));
}


}

/// @nodoc


class BillingCheckoutLoading implements BillingState {
  const BillingCheckoutLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingCheckoutLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BillingState.checkoutLoading()';
}


}




/// @nodoc


class BillingCheckoutReady implements BillingState {
  const BillingCheckoutReady({required this.checkoutUrl});
  

 final  String checkoutUrl;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingCheckoutReadyCopyWith<BillingCheckoutReady> get copyWith => _$BillingCheckoutReadyCopyWithImpl<BillingCheckoutReady>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingCheckoutReady&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl));
}


@override
int get hashCode => Object.hash(runtimeType,checkoutUrl);

@override
String toString() {
  return 'BillingState.checkoutReady(checkoutUrl: $checkoutUrl)';
}


}

/// @nodoc
abstract mixin class $BillingCheckoutReadyCopyWith<$Res> implements $BillingStateCopyWith<$Res> {
  factory $BillingCheckoutReadyCopyWith(BillingCheckoutReady value, $Res Function(BillingCheckoutReady) _then) = _$BillingCheckoutReadyCopyWithImpl;
@useResult
$Res call({
 String checkoutUrl
});




}
/// @nodoc
class _$BillingCheckoutReadyCopyWithImpl<$Res>
    implements $BillingCheckoutReadyCopyWith<$Res> {
  _$BillingCheckoutReadyCopyWithImpl(this._self, this._then);

  final BillingCheckoutReady _self;
  final $Res Function(BillingCheckoutReady) _then;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? checkoutUrl = null,}) {
  return _then(BillingCheckoutReady(
checkoutUrl: null == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class BillingError implements BillingState {
  const BillingError({required this.failure});
  

 final  Failure failure;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BillingErrorCopyWith<BillingError> get copyWith => _$BillingErrorCopyWithImpl<BillingError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BillingError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'BillingState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $BillingErrorCopyWith<$Res> implements $BillingStateCopyWith<$Res> {
  factory $BillingErrorCopyWith(BillingError value, $Res Function(BillingError) _then) = _$BillingErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$BillingErrorCopyWithImpl<$Res>
    implements $BillingErrorCopyWith<$Res> {
  _$BillingErrorCopyWithImpl(this._self, this._then);

  final BillingError _self;
  final $Res Function(BillingError) _then;

/// Create a copy of BillingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(BillingError(
failure: null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
