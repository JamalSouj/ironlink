import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

/// All possible authentication states.
///
/// Use sealed class pattern matching — never `is` checks with manual casting.
///
/// UI example:
/// ```dart
/// BlocBuilder<AuthBloc, AuthState>(
///   builder: (context, state) => switch (state) {
///     Unauthenticated()         => const LoginPage(),
///     Authenticating()          => const LoadingIndicator(),
///     AuthenticatedCoach(:final user) => CoachShell(user: user),
///     AuthenticatedClient(:final user) => ClientShell(user: user),
///     AuthError(:final failure) => ErrorView(failure: failure),
///   },
/// )
/// ```
@freezed
sealed class AuthState with _$AuthState {
  /// Initial state — no session detected yet.
  const factory AuthState.unauthenticated() = Unauthenticated;

  /// Sign-in / sign-up request is in flight.
  const factory AuthState.authenticating() = Authenticating;

  /// A coach has successfully authenticated.
  const factory AuthState.authenticatedCoach({required AuthUser user}) =
      AuthenticatedCoach;

  /// A client has successfully authenticated.
  const factory AuthState.authenticatedClient({required AuthUser user}) =
      AuthenticatedClient;

  /// An auth operation failed.
  const factory AuthState.error({required Failure failure}) = AuthError;
}
