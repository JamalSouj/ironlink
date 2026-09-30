/// Application-wide string and numeric constants.
///
/// Secrets (Supabase URL, anon key) are NEVER defined here.
/// They are loaded at runtime from the `.env` file via [flutter_dotenv].
abstract final class AppConstants {
  // ── .env key names ──────────────────────────────────────────────────────
  /// The `.env` key for the Supabase project URL.
  static const String envSupabaseUrl = 'SUPABASE_URL';

  /// The `.env` key for the Supabase anonymous (public) API key.
  static const String envSupabasePublishableKey = 'SUPABASE_PUBLISHABLE_KEY';

  /// The `.env` key for the Stripe Pro Plan Price ID.
  static const String envStripeProPriceId = 'STRIPE_PRO_PRICE_ID';

  // ── Pagination ──────────────────────────────────────────────────────────
  static const int defaultPageSize = 20;

  // ── Cache TTL ───────────────────────────────────────────────────────────
  static const Duration cacheTtl = Duration(minutes: 15);
}
