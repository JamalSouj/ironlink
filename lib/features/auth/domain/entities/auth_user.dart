import 'package:ironlink/features/auth/domain/entities/user_role.dart';

/// Authenticated user in the domain layer.
///
/// Plain Dart class — no Freezed, no Supabase, no Flutter imports.
/// Equality is structural (id, email, fullName, role).
final class AuthUser {
  const AuthUser({
    required this.id,
    required this.email,
    required this.fullName,
    required this.role,
    this.avatarUrl,
    this.createdAt,
  });

  /// Supabase auth UUID (`auth.users.id`).
  final String id;

  /// Primary email address.
  final String email;

  /// Display name sourced from `profiles.full_name`.
  final String fullName;

  /// Platform role — determines which app shell is shown.
  final UserRole role;

  final String? avatarUrl;

  final DateTime? createdAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUser &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          email == other.email &&
          fullName == other.fullName &&
          role == other.role &&
          avatarUrl == other.avatarUrl &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      Object.hash(id, email, fullName, role, avatarUrl, createdAt);

  @override
  String toString() =>
      'AuthUser(id: $id, email: $email, fullName: $fullName, role: $role, avatarUrl: $avatarUrl, createdAt: $createdAt)';
}
