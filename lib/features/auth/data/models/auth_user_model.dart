import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/domain/entities/user_role.dart';

part 'auth_user_model.freezed.dart';
part 'auth_user_model.g.dart';

/// Freezed data-transfer object for the `profiles` Supabase table row.
///
/// Maps directly to the column names in `public.profiles`:
/// ```sql
/// id          UUID  (PK, references auth.users.id)
/// email       TEXT
/// full_name   TEXT
/// role        TEXT  ('coach' | 'client')
/// invite_code TEXT  (nullable — stored when client signs up via invite)
/// avatar_url  TEXT
/// created_at  TIMESTAMPTZ
/// ```
///
/// JSON field naming (snake_case ↔ camelCase) is handled globally via
/// `build.yaml` (`field_rename: snake`) so no `@JsonKey` annotations needed.
@freezed
abstract class AuthUserModel with _$AuthUserModel {
  const AuthUserModel._();

  const factory AuthUserModel({
    required String id,
    required String email,
    required String fullName,
    required String role,
    String? inviteCode,
    String? avatarUrl,
    DateTime? createdAt,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);

  // ── Domain mapping ────────────────────────────────────────────────────────

  /// Convert to a domain [AuthUser]. Throws [ArgumentError] if [role] is not
  /// a valid [UserRole] name — indicates a data integrity issue in Supabase.
  AuthUser toDomain() => AuthUser(
    id: id,
    email: email,
    fullName: fullName,
    role: UserRole.values.byName(role),
    avatarUrl: avatarUrl,
    createdAt: createdAt,
  );

  /// Create a model from a domain [AuthUser].
  static AuthUserModel fromDomain(AuthUser user) => AuthUserModel(
    id: user.id,
    email: user.email,
    fullName: user.fullName,
    role: user.role.name,
    avatarUrl: user.avatarUrl,
    createdAt: user.createdAt,
  );
}
