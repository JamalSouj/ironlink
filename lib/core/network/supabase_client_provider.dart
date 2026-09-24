import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Injectable module that registers the [SupabaseClient] singleton with get_it.
///
/// The [SupabaseClient] is accessed from the already-initialised
/// `Supabase.instance` which is set up in each entry-point before
/// [configureDependencies] is called.
///
/// Usage in feature data-sources:
/// ```dart
/// @injectable
/// class AuthRemoteDataSource {
///   AuthRemoteDataSource(this._client);
///   final SupabaseClient _client;
/// }
/// ```
@module
abstract class SupabaseModule {
  /// Returns the already-initialised [SupabaseClient] singleton.
  ///
  /// Supabase.initialize() MUST be called before [configureDependencies()].
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
}
