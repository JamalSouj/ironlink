import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Sign out the currently authenticated user.
///
/// Clears the Supabase session. Returns [Unit] on success.
@injectable
class SignOut extends UseCase<Unit, NoParams> {
  SignOut(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(NoParams params) => _repository.signOut();
}
