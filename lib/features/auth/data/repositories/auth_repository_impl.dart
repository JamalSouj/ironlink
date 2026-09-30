import 'dart:async';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:ironlink/core/error/exceptions.dart';
import 'package:ironlink/core/error/failures.dart';
import 'package:ironlink/features/auth/data/datasources/remote/supabase_auth_data_source.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/domain/repositories/auth_repository.dart';

/// Concrete implementation of [AuthRepository].
///
/// Responsibility: catch [AppException] subtypes from [SupabaseAuthDataSource]
/// and convert them to [Failure] values wrapped in [Either].
/// No exceptions escape this class.
@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._dataSource);

  final SupabaseAuthDataSource _dataSource;

  // ── Auth operations ───────────────────────────────────────────────────────

  @override
  Future<Either<Failure, AuthUser>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final model = await _dataSource.signIn(email: email, password: password);
      return right(model.toDomain());
    } on AuthException catch (e) {
      return left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Unexpected error during sign-in: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUpCoach({
    required String email,
    required String password,
    required String fullName,
  }) async {
    try {
      final model = await _dataSource.signUpCoach(
        email: email,
        password: password,
        fullName: fullName,
      );
      return right(model.toDomain());
    } on AuthException catch (e) {
      return left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Unexpected error during coach sign-up: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, AuthUser>> signUpClient({
    required String email,
    required String password,
    required String fullName,
    String? inviteCode,
  }) async {
    try {
      final model = await _dataSource.signUpClient(
        email: email,
        password: password,
        fullName: fullName,
        inviteCode: inviteCode,
      );
      return right(model.toDomain());
    } on AuthException catch (e) {
      return left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Unexpected error during client sign-up: $e'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> signOut() async {
    try {
      await _dataSource.signOut();
      return right(unit);
    } on AuthException catch (e) {
      return left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Unexpected error during sign-out: $e'),
      );
    }
  }

  // ── Streaming ─────────────────────────────────────────────────────────────

  @override
  Stream<Either<Failure, AuthUser?>> watchAuthState() {
    // Convert exceptions emitted by the datasource stream into Either.left
    // values so the domain and presentation layers never see raw exceptions.
    return _dataSource.watchAuthState().transform(
      StreamTransformer.fromHandlers(
        handleData: (model, sink) {
          sink.add(right<Failure, AuthUser?>(model?.toDomain()));
        },
        handleError: (error, _, sink) {
          if (error is AuthException) {
            sink.add(
              left<Failure, AuthUser?>(AuthFailure(message: error.message)),
            );
          } else if (error is ServerException) {
            sink.add(
              left<Failure, AuthUser?>(ServerFailure(message: error.message)),
            );
          } else {
            sink.add(
              left<Failure, AuthUser?>(
                ServerFailure(message: error.toString()),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  Future<Either<Failure, AuthUser?>> getCurrentUser() async {
    try {
      final model = await _dataSource.getCurrentUser();
      return right(model?.toDomain());
    } on AuthException catch (e) {
      return left(AuthFailure(message: e.message));
    } on ServerException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(
        ServerFailure(message: 'Unexpected error fetching current user: $e'),
      );
    }
  }
}
