import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';

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

