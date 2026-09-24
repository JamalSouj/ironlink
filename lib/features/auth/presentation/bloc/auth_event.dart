import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

/// All events the [AuthBloc] can handle.
///
/// Use sealed class pattern matching (`.when()` / `switch`) in handlers.
/// Never add an event from inside a [Bloc] — only from the presentation layer.
@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Dispatched once on app start to subscribe to the Supabase auth stream.
  ///
  /// Drives the [AuthBloc] via [Emitter.forEach] for the app's lifetime.
  const factory AuthEvent.started() = AuthStarted;

  /// Authenticate with email + password.
  const factory AuthEvent.signInRequested({
    required String email,
    required String password,
  }) = SignInRequested;

  /// Register a new coach account.
  const factory AuthEvent.signUpCoachRequested({
    required String email,
    required String password,
    required String fullName,
  }) = SignUpCoachRequested;

  /// Register a new client account (with optional invite code).
  const factory AuthEvent.signUpClientRequested({
    required String email,
    required String password,
    required String fullName,
    String? inviteCode,
  }) = SignUpClientRequested;

  /// Sign out the current user.
  const factory AuthEvent.signOutRequested() = SignOutRequested;
}
