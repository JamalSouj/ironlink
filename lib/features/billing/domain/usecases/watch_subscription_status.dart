import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';
import 'package:ironlink/features/billing/domain/repositories/billing_repository.dart';

@injectable
class WatchSubscriptionStatus extends StreamUseCase<Subscription?, String> {
  WatchSubscriptionStatus(this._repository);
  final BillingRepository _repository;
  
  @override
  Stream<Either<Failure, Subscription?>> call(String params) {
    return _repository.watchSubscriptionStatus(params);
  }
}
