import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/auth/domain/entities/auth_user.dart';
import 'package:ascent/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Parameters required for the [SignIn] use case.
final class SignInParams {
  const SignInParams({required this.email, required this.password});

  final String email;
  final String password;
}

/// Authenticate an existing user with email + password.
///
/// Returns the [AuthUser] on success, or a [Failure] on error.
@injectable
class SignIn extends UseCase<AuthUser, SignInParams> {
  SignIn(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(SignInParams params) =>
      _repository.signIn(email: params.email, password: params.password);
}
