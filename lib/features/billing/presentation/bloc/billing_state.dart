import 'package:ascent/core/error/failures.dart';
import 'package:ascent/features/billing/domain/entities/subscription.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_state.freezed.dart';

@freezed
sealed class BillingState with _$BillingState {
  const factory BillingState.initial() = BillingInitial;
  const factory BillingState.loading() = BillingLoading;
  const factory BillingState.loaded({required Subscription? subscription}) =
      BillingLoaded;
  const factory BillingState.checkoutLoading() = BillingCheckoutLoading;
  const factory BillingState.checkoutReady({required String checkoutUrl}) =
      BillingCheckoutReady;
  const factory BillingState.error({required Failure failure}) = BillingError;
}

