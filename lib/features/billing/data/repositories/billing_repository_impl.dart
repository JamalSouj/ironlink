import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/billing/data/datasources/remote/supabase_billing_data_source.dart';
import 'package:ironlink/features/billing/domain/entities/subscription.dart';
import 'package:ironlink/features/billing/domain/repositories/billing_repository.dart';

@LazySingleton(as: BillingRepository)
class BillingRepositoryImpl implements BillingRepository {
  BillingRepositoryImpl(this._remote);

  final SupabaseBillingDataSource _remote;

  @override
  Future<Either<Failure, String>> createCheckoutSession(String priceId, String redirectUrl) async {
    try {
      final url = await _remote.createCheckoutSession(priceId, redirectUrl);
      return Right(url);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Stream<Either<Failure, Subscription?>> watchSubscriptionStatus(String coachId) async* {
    try {
      await for (final model in _remote.watchSubscriptionStatus(coachId)) {
        yield right<Failure, Subscription?>(model?.toDomain());
      }
    } on ServerException catch (e) {
      yield left<Failure, Subscription?>(ServerFailure(message: e.message));
    } catch (e) {
      yield left<Failure, Subscription?>(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Subscription?>> checkSubscriptionStatus(String coachId) async {
    try {
      final model = await _remote.checkSubscriptionStatus(coachId);
      return Right(model?.toDomain());
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
