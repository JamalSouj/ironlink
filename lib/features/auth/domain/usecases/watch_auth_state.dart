import 'package:ascent/core/error/failures.dart';
import 'package:ascent/core/usecases/usecase.dart';
import 'package:ascent/features/auth/domain/entities/auth_user.dart';
import 'package:ascent/features/auth/domain/repositories/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

/// Stream the current auth state for the lifetime of the app.
///
/// Emits an [AuthUser] when authenticated, `null` when signed out.
/// All errors are wrapped in `Left<Failure>` — the stream never throws.
///
/// In the presentation layer, drive this via [Bloc.on<AuthStarted>] +
/// [Emitter.forEach] so the subscription is managed by the BLoC lifecycle.
@injectable
class WatchAuthState extends StreamUseCase<AuthUser?, NoParams> {
  WatchAuthState(this._repository);

  final AuthRepository _repository;

  @override
  Stream<Either<Failure, AuthUser?>> call(NoParams params) =>
      _repository.watchAuthState();
}
