import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';
import 'package:ironlink/features/billing/domain/usecases/create_checkout_session.dart';
import 'package:ironlink/features/billing/domain/usecases/watch_subscription_status.dart';
import 'package:ironlink/features/billing/presentation/bloc/billing_event.dart';
import 'package:ironlink/features/billing/presentation/bloc/billing_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class BillingBloc extends Bloc<BillingEvent, BillingState> {
  BillingBloc(
    this._watchSubscriptionStatus,
    this._createCheckoutSession,
  ) : super(const BillingState.initial()) {
    on<BillingEvent>((event, emit) async {
      await switch (event) {
        BillingStarted() => _onStarted(event, emit),
        BillingCheckoutRequested() => _onCheckoutRequested(event, emit),
      };
    });
  }

  final WatchSubscriptionStatus _watchSubscriptionStatus;
  final CreateCheckoutSession _createCheckoutSession;

  Future<void> _onStarted(
    BillingStarted e,
    Emitter<BillingState> emit,
  ) async {
    emit(const BillingState.loading());
    await emit.forEach<Either<Failure, Subscription?>>(
      _watchSubscriptionStatus(e.coachId),
      onData: (either) => either.fold(
        (failure) => BillingState.error(failure: failure),
        (subscription) => BillingState.loaded(subscription: subscription),
      ),
      onError: (error, _) => BillingState.error(
        failure: ServerFailure(message: error.toString()),
      ),
    );
  }

  Future<void> _onCheckoutRequested(
    BillingCheckoutRequested e,
    Emitter<BillingState> emit,
  ) async {
    // We save the previous state so we don't lose the subscription data
    final previousState = state;
    emit(const BillingState.checkoutLoading());

    final result = await _createCheckoutSession(
      CreateCheckoutParams(priceId: e.priceId, redirectUrl: e.redirectUrl),
    );

    result.fold(
      (f) {
        emit(BillingState.error(failure: f));
        // Revert to loaded after showing error
        if (previousState is BillingLoaded) emit(previousState);
      },
      (url) {
        emit(BillingState.checkoutReady(checkoutUrl: url));
        // Revert to loaded after URL is consumed by the UI
        if (previousState is BillingLoaded) emit(previousState);
      },
    );
  }
}
