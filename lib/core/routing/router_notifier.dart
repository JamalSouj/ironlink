import 'dart:async';

import 'package:ascent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/foundation.dart';

/// Adapts [AuthBloc]'s stream to [Listenable] for use as
/// [GoRouter.refreshListenable].
///
/// GoRouter calls [refresh] whenever [notifyListeners] fires, which triggers
/// a re-evaluation of the router's [redirect] function. This means the
/// redirect logic in [AppRouter] is the single source of truth for navigation
/// — no page-level push/pop needed for auth state changes.
///
/// Lifecycle: call [dispose] when the root widget is disposed to cancel the
/// stream subscription.
class RouterNotifier extends ChangeNotifier {
  RouterNotifier(AuthBloc authBloc) : _authBloc = authBloc {
    _subscription = authBloc.stream.listen((_) => notifyListeners());
  }

  final AuthBloc _authBloc;
  late final StreamSubscription<AuthState> _subscription;

  /// The current [AuthState] — read by [AppRouter._guard] in redirect().
  AuthState get authState => _authBloc.state;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
