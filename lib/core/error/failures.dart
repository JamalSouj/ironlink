/// Base class for all domain-layer failures.
///
/// Failures are plain value objects — they carry a human-readable [message]
/// and an optional [stackTrace] for debugging.  They NEVER wrap Supabase or
/// data-layer types so the domain stays fully portable.
///
/// Pattern-match on the concrete subtypes in the presentation layer:
/// ```dart
/// state.failure.when(
///   server: (f) => f.message,
///   cache: (f) => 'Offline data unavailable',
///   auth: (f) => f.message,
///   validation: (f) => f.message,
/// );
/// ```
sealed class Failure {
  const Failure({required this.message, this.stackTrace});

  final String message;
  final StackTrace? stackTrace;

  @override
  String toString() => '$runtimeType(message: $message)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}

// ── Concrete failure types ───────────────────────────────────────────────────

/// Returned when a remote API / Supabase call fails (network, 4xx, 5xx).
final class ServerFailure extends Failure {
  const ServerFailure({
    required super.message,
    this.statusCode,
    super.stackTrace,
  });

  /// HTTP status code, if available (null for network-level failures).
  final int? statusCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServerFailure &&
        other.message == message &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => message.hashCode ^ statusCode.hashCode;
}

/// Returned when a local cache read/write fails (Hive, Isar, SharedPrefs).
final class CacheFailure extends Failure {
  const CacheFailure({required super.message, super.stackTrace});
}

/// Returned for authentication-specific failures (invalid credentials,
/// session expired, insufficient permissions).
final class AuthFailure extends Failure {
  const AuthFailure({required super.message, super.stackTrace});
}

/// Returned when input validation fails before any remote/local call is made.
final class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    this.field,
    super.stackTrace,
  });

  /// The specific form field that failed validation, if applicable.
  final String? field;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationFailure &&
        other.message == message &&
        other.field == field;
  }

  @override
  int get hashCode => message.hashCode ^ field.hashCode;
}
