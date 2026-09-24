/// Roles a user can hold in the Ascent platform.
///
/// The string representation (`.name`) is stored verbatim in the
/// `profiles.role` column so Supabase RLS policies can filter by role.
enum UserRole {
  /// A fitness coach who manages programs and clients.
  coach,

  /// An athlete/client assigned to a coach.
  client,
}
