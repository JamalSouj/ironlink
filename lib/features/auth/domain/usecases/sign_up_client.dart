import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Parameters required for the [SignUpClient] use case.
final class SignUpClientParams {
  const SignUpClientParams({
    required this.email,
    required this.password,
    required this.fullName,
    this.inviteCode,
  });

  final String email;
  final String password;
  final String fullName;

  /// Optional invite code provided by a coach.
  ///
  /// When supplied it is stored in the `profiles` row and will be validated
  /// against the coach's invite record once the invite system is built.
  final String? inviteCode;
}

/// Register a new client account.
///
/// Creates both the Supabase auth user and the corresponding `profiles` row
/// with `role = 'client'`.
///
/// Supports an optional [SignUpClientParams.inviteCode] that links the client
/// to their coach's invitation. Invite validation is stubbed until the
/// `invitations` feature module is implemented — see TODO below.
@injectable
class SignUpClient extends UseCase<AuthUser, SignUpClientParams> {
  SignUpClient(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthUser>> call(SignUpClientParams params) {
    // Invite validation and consumption is handled in the data source via RPC.
    return _repository.signUpClient(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
      inviteCode: params.inviteCode,
    );
  }
}
