import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/core/usecases/usecase.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/domain/entities/user_role.dart';
import 'package:ironlink/features/auth/domain/usecases/sign_in.dart';
import 'package:ironlink/features/auth/domain/usecases/sign_out.dart';
import 'package:ironlink/features/auth/domain/usecases/sign_up_client.dart';
import 'package:ironlink/features/auth/domain/usecases/sign_up_coach.dart';
import 'package:ironlink/features/auth/domain/usecases/watch_auth_state.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_event.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Manages all authentication state for the app.
///
/// ### Architecture rules enforced here
/// - Interacts ONLY with injected use cases — never datasources directly.
/// - State is a [AuthState] sealed class — no `setState` anywhere.
/// - [AuthStarted] subscribes to the Supabase auth stream via [Emitter.forEach];
///   the subscription lives for the BLoC's lifetime.
/// - Other event handlers (sign-in, sign-up, sign-out) coexist with the
///   stream subscription because BLoC processes different event types
///   concurrently by default in flutter_bloc ≥ 8.
///
/// ### Lifecycle
/// Dispatch [AuthEvent.started] once, in the root widget's `initState`.
/// The BLoC is registered as a [lazySingleton] so there is exactly one
/// instance for the app's lifetime.
@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUpCoach signUpCoach,
    required SignUpClient signUpClient,
    required SignOut signOut,
    required WatchAuthState watchAuthState,
  }) : _signIn = signIn,
       _signUpCoach = signUpCoach,
       _signUpClient = signUpClient,
       _signOut = signOut,
       _watchAuthState = watchAuthState,
       super(const AuthState.unauthenticated()) {
    on<AuthStarted>(_onStarted);
    on<SignInRequested>(_onSignIn);
    on<SignUpCoachRequested>(_onSignUpCoach);
    on<SignUpClientRequested>(_onSignUpClient);
    on<SignOutRequested>(_onSignOut);
  }

  final SignIn _signIn;
  final SignUpCoach _signUpCoach;
  final SignUpClient _signUpClient;
  final SignOut _signOut;
  final WatchAuthState _watchAuthState;

  // ── Handlers ─────────────────────────────────────────────────────────────

  /// Subscribe to the Supabase auth stream for the BLoC's lifetime.
  ///
  /// [Emitter.forEach] manages the subscription — it is automatically
  /// cancelled when the BLoC is closed.
  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    await emit.forEach<Either<Failure, AuthUser?>>(
      _watchAuthState(const NoParams()),
      onData: (either) => either.fold(
        (failure) => AuthState.error(failure: failure),
        (user) => user != null
            ? _stateForUser(user)
            : const AuthState.unauthenticated(),
      ),
      onError: (error, stackTrace) => const AuthState.error(
        failure: ServerFailure(message: 'Auth stream encountered an error.'),
      ),
    );
  }

  Future<void> _onSignIn(SignInRequested event, Emitter<AuthState> emit) async {
    emit(const AuthState.authenticating());
    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );
    emit(
      result.fold(
        (failure) => AuthState.error(failure: failure),
        (user) => _stateForUser(user),
      ),
    );
  }

  Future<void> _onSignUpCoach(
    SignUpCoachRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.authenticating());
    final result = await _signUpCoach(
      SignUpCoachParams(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
      ),
    );
    emit(
      result.fold(
        (failure) => AuthState.error(failure: failure),
        (user) => _stateForUser(user),
      ),
    );
  }

  Future<void> _onSignUpClient(
    SignUpClientRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.authenticating());
    final result = await _signUpClient(
      SignUpClientParams(
        email: event.email,
        password: event.password,
        fullName: event.fullName,
        inviteCode: event.inviteCode,
      ),
    );
    emit(
      result.fold(
        (failure) => AuthState.error(failure: failure),
        (user) => _stateForUser(user),
      ),
    );
  }

  Future<void> _onSignOut(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.authenticating());
    final result = await _signOut(const NoParams());
    emit(
      result.fold(
        (failure) => AuthState.error(failure: failure),
        (_) => const AuthState.unauthenticated(),
      ),
    );
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  AuthState _stateForUser(AuthUser user) => switch (user.role) {
    UserRole.coach => AuthState.authenticatedCoach(user: user),
    UserRole.client => AuthState.authenticatedClient(user: user),
  };
}
