import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';

/// Contract for all authentication operations.
///
/// Implementations live in the data layer. The domain layer only knows
/// about this interface — never the concrete class.
///
/// Every method returns `Either<Failure, T>`:
/// - `Left<Failure>` for any error (network, auth, validation)
/// - `Right<T>` for success
///
/// No exceptions cross this boundary.
abstract class AuthRepository {
  /// Authenticate with email + password.
  Future<Either<Failure, AuthUser>> signIn({
    required String email,
    required String password,
  });

  /// Register a new coach account and create their `profiles` row.
  Future<Either<Failure, AuthUser>> signUpCoach({
    required String email,
    required String password,
    required String fullName,
  });

  /// Register a new client account and create their `profiles` row.
  ///
  /// [inviteCode] is optional. When provided it will be stored in the profile
  /// and eventually validated against the coach's invite record.
  /// Invite validation is stubbed until the invite system is built.
  Future<Either<Failure, AuthUser>> signUpClient({
    required String email,
    required String password,
    required String fullName,
    String? inviteCode,
  });

  /// Sign out the current user and clear the local session.
  Future<Either<Failure, Unit>> signOut();

  /// Emits the current [AuthUser] whenever the auth state changes.
  ///
  /// Emits `null` when the user signs out or no session exists.
  /// Errors (e.g. profile fetch failures) are emitted as `Left<Failure>`.
  /// This stream never completes — it lives for the app's lifetime.
  Stream<Either<Failure, AuthUser?>> watchAuthState();

  /// Returns the currently authenticated user, or `null` if unauthenticated.
  Future<Either<Failure, AuthUser?>> getCurrentUser();
}
