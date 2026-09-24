// Data-layer exceptions.
//
// These are thrown within data-source implementations and caught by the
// concrete repository implementations, which convert them into [Failure]
// objects before returning across the layer boundary.
//
// NEVER let these escape into the domain or presentation layers.

/// Thrown by remote data sources when a Supabase / HTTP call fails.
final class ServerException implements Exception {
  const ServerException({required this.message, this.statusCode});

  final String message;
  final int? statusCode;

  @override
  String toString() => 'ServerException($statusCode): $message';
}

/// Thrown by local data sources when a cache read/write fails.
final class CacheException implements Exception {
  const CacheException({required this.message});

  final String message;

  @override
  String toString() => 'CacheException: $message';
}

/// Thrown by auth data sources when authentication fails at the SDK level.
final class AuthException implements Exception {
  const AuthException({required this.message});

  final String message;

  @override
  String toString() => 'AuthException: $message';
}
