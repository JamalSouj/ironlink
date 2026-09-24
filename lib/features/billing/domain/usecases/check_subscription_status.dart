import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/billing/domain/entities/subscription.dart';
import 'package:ascent/features/billing/domain/repositories/billing_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class CheckSubscriptionStatus extends UseCase<Subscription?, String> {
  CheckSubscriptionStatus(this._repository);
  final BillingRepository _repository;
  
  @override
  Future<Either<Failure, Subscription?>> call(String params) async {
    return await _repository.checkSubscriptionStatus(params);
  }
}
