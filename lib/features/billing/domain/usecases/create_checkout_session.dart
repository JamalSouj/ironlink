import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/billing/domain/repositories/billing_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

class CreateCheckoutParams {
  final String priceId;
  final String redirectUrl;
  const CreateCheckoutParams({required this.priceId, required this.redirectUrl});
}

@injectable
class CreateCheckoutSession extends UseCase<String, CreateCheckoutParams> {
  CreateCheckoutSession(this._repository);
  final BillingRepository _repository;
  
  @override
  Future<Either<Failure, String>> call(CreateCheckoutParams params) async {
    return await _repository.createCheckoutSession(params.priceId, params.redirectUrl);
  }
}
