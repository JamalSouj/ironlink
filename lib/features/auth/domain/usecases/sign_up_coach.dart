import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Parameters required for the [SignUpCoach] use case.
final class SignUpCoachParams {
  const SignUpCoachParams({
    required this.email,
    required this.password,
    required this.fullName,
  });

  final String email;
  final String password;
  final String fullName;
}

/// Register a new coach account.
///
/// Creates both the Supabase auth user and the corresponding `profiles` row
/// with `role = 'coach'`.
@injectable
class SignUpCoach extends UseCase<AuthUser, SignUpCoachParams> {
  SignUpCoach(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(SignUpCoachParams params) =>
      _repository.signUpCoach(
        email: params.email,
        password: params.password,
        fullName: params.fullName,
      );
}
