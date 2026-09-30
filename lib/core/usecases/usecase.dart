import 'package:fpdart/fpdart.dart';
import 'package:ironlink/core/error/failures.dart';

/// Base contract for all use cases in the domain layer.
///
/// [SuccessType] is the success return type.
/// [Params] is the input parameter type (use [NoParams] when none needed).
///
/// Every use case returns `Future<Either<Failure, SuccessType>>` — failures
/// are always modelled as values, never thrown across layer boundaries.
///
/// Domain layer ONLY. No Flutter, Supabase, or data-layer imports here.
abstract class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

/// Base contract for use cases that emit multiple values over time.
///
/// Use this for streaming use cases such as watching auth state or
/// subscribing to realtime database updates.
///
/// Example:
/// ```dart
/// class WatchAuthState extends StreamUseCase<AuthUser?, NoParams> {
///   @override
///   Stream<Either<Failure, AuthUser?>> call(NoParams params) => ...;
/// }
/// ```
abstract class StreamUseCase<SuccessType, Params> {
  Stream<Either<Failure, SuccessType>> call(Params params);
}

/// Sentinel parameter type for use cases that take no arguments.
///
/// Usage:
/// ```dart
/// class GetCurrentUserUseCase extends UseCase<User, NoParams> {
///   @override
///   Future<Either<Failure, User>> call(NoParams params) { ... }
/// }
/// // call site:
/// useCase(const NoParams());
/// ```
final class NoParams {
  const NoParams();
}
