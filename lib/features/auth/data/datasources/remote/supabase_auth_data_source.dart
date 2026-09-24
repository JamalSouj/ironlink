import 'package:ascent/core/error/exceptions.dart';
import 'package:ascent/features/auth/data/models/auth_user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as sb;

/// Remote data source — wraps Supabase auth methods.
///
/// Responsibilities:
///   1. Call Supabase auth SDK (signIn, signUp, signOut, stream).
///   2. Immediately after sign-up, insert the `profiles` row with the role.
///   3. Convert all Supabase / SDK exceptions into [AppException] subtypes
///      so the repository can map them to domain [Failure] objects.
///
/// This class NEVER returns domain entities — it works with [AuthUserModel].
@lazySingleton
class SupabaseAuthDataSource {
  const SupabaseAuthDataSource(this._client);

  final sb.SupabaseClient _client;

  // ── Auth operations ───────────────────────────────────────────────────────

  Future<AuthUserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        throw const AuthException(
          message: 'Sign-in succeeded but no user returned.',
        );
      }
      return _fetchProfile(user.id);
    } on sb.AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  Future<AuthUserModel> signUpCoach({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        throw const AuthException(
          message: 'Sign-up succeeded but no user returned.',
        );
      }

      // Insert the profiles row with role = 'coach'.
      await _client.from('profiles').insert({
        'id': user.id,
        'full_name': fullName,
        'role': 'coach',
      });

      return AuthUserModel(
        id: user.id,
        email: email,
        fullName: fullName,
        role: 'coach',
      );
    } on sb.AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  Future<AuthUserModel> signUpClient({
    required String email,
    required String password,
    required String fullName,
    String? inviteCode,
  }) async {
    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
      );
      final user = response.user;
      if (user == null) {
        throw const AuthException(
          message: 'Sign-up succeeded but no user returned.',
        );
      }

      if (inviteCode != null && inviteCode.isNotEmpty) {
        // Use RPC to atomically consume the invite, create profile, and link coach
        await _client.rpc(
          'consume_invite_and_create_client',
          params: {
            'p_invite_code': inviteCode,
            'p_auth_user_id': user.id,
            'p_full_name': fullName,
            'p_email': email,
          },
        );
      } else {
        // Insert the profiles row with role = 'client' normally
        await _client.from('profiles').insert({
          'id': user.id,
          'full_name': fullName,
          'role': 'client',
        });
      }

      return AuthUserModel(
        id: user.id,
        email: email,
        fullName: fullName,
        role: 'client',
        inviteCode: inviteCode,
      );
    } on sb.AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
    } on sb.AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  // ── Streaming ─────────────────────────────────────────────────────────────

  /// Emits the profile of the authenticated user on every auth state change,
  /// or `null` when the session is cleared.
  ///
  /// Uses [asyncMap] to fetch the profile row after every Supabase auth event.
  /// Errors inside the map are converted to [ServerException] so the
  /// repository can transform them into [Either.left] values.
  Stream<AuthUserModel?> watchAuthState() {
    return _client.auth.onAuthStateChange.asyncMap((event) async {
      final session = event.session;
      if (session == null) return null;
      try {
        return await _fetchProfile(session.user.id);
      } on sb.AuthException catch (e) {
        throw AuthException(message: e.message);
      } catch (e) {
        if (e is AuthException) rethrow;
        throw ServerException(message: e.toString());
      }
    });
  }

  Future<AuthUserModel?> getCurrentUser() async {
    final user = _client.auth.currentUser;
    if (user == null) return null;
    try {
      return await _fetchProfile(user.id);
    } on sb.AuthException catch (e) {
      throw AuthException(message: e.message);
    } catch (e) {
      if (e is AuthException) rethrow;
      throw ServerException(message: e.toString());
    }
  }

  // ── Private helpers ───────────────────────────────────────────────────────

  Future<AuthUserModel> _fetchProfile(String userId) async {
    final data = await _client
        .from('profiles')
        .select()
        .eq('id', userId)
        .single();
    return AuthUserModel.fromJson(Map<String, dynamic>.from(data as Map));
  }
}
