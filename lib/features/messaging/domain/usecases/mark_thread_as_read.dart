import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/messaging/domain/repositories/messaging_repository.dart';

class MarkThreadAsReadParams {
  final String currentUserId;
  final String peerId;
  const MarkThreadAsReadParams({required this.currentUserId, required this.peerId});
}

@injectable
class MarkThreadAsRead extends UseCase<Unit, MarkThreadAsReadParams> {
  MarkThreadAsRead(this._repository);
  final MessagingRepository _repository;
  
  @override
  Future<Either<Failure, Unit>> call(MarkThreadAsReadParams params) async {
    return await _repository.markThreadAsRead(params.currentUserId, params.peerId);
  }
}
