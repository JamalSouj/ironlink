import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';
import 'package:fpdart/fpdart.dart';

abstract class BillingRepository {
  Future<Either<Failure, String>> createCheckoutSession(String priceId, String redirectUrl);
  Stream<Either<Failure, Subscription?>> watchSubscriptionStatus(String coachId);
  Future<Either<Failure, Subscription?>> checkSubscriptionStatus(String coachId);
}
