import 'package:freezed_annotation/freezed_annotation.dart';

part 'billing_event.freezed.dart';

@freezed
sealed class BillingEvent with _$BillingEvent {
  const factory BillingEvent.started({required String coachId}) =
      BillingStarted;
  const factory BillingEvent.checkoutRequested({
    required String priceId,
    required String redirectUrl,
  }) = BillingCheckoutRequested;
}
