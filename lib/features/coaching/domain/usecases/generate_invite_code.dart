import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/billing/domain/usecases/check_subscription_status.dart';
import 'package:ascent/features/coaching/domain/repositories/coaching_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateInviteCode extends UseCase<String, String> {
  GenerateInviteCode(this._repository, this._checkSubscriptionStatus);

  final CoachingRepository _repository;
  final CheckSubscriptionStatus _checkSubscriptionStatus;

  @override
  Future<Either<Failure, String>> call(String params) async {
    // 1. Check current active subscription
    final subResult = await _checkSubscriptionStatus(params);
    final subscription = subResult.getOrElse((_) => null);
    
    // 2. Check current client count
    final countResult = await _repository.getClientCount(params);
    if (countResult.isLeft()) {
      return Left(countResult.fold((l) => l, (r) => throw UnimplementedError()));
    }
    
    final clientCount = countResult.getOrElse((_) => 0);
    
    // 3. Apply limit logic: Starter tier (no active pro sub) -> max 3 clients
    final isPro = subscription?.isPro ?? false;
    if (!isPro && clientCount >= 3) {
      return const Left(
        ServerFailure(message: 'Client limit reached. Please upgrade to Pro to add more clients.'),
      );
    }
    
    return _repository.generateInviteCode(params);
  }
}
