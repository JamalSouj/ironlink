import 'package:ironlink/core/routing/router_notifier.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/auth/presentation/pages/client_sign_up_page.dart';
import 'package:ironlink/features/auth/presentation/pages/coach_sign_up_page.dart';
import 'package:ironlink/features/auth/presentation/pages/login_page.dart';
import 'package:ironlink/features/billing/presentation/pages/billing_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/client_shell_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/coach_shell_page.dart';
import 'package:ironlink/features/messaging/presentation/pages/conversations_list_page.dart';
import 'package:ironlink/features/programs/presentation/pages/client_today_page.dart';
import 'package:ironlink/features/progressions/presentation/pages/client_progressions_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Central router configuration.
///
/// The [RouterNotifier] (fed by [AuthBloc]'s stream) is wired as
/// [refreshListenable] so that any auth state change triggers a
/// re-evaluation of [_guard].
///
/// Auth guard logic lives HERE and ONLY here — pages never push/pop for
/// auth state changes.
///
/// Route map:
///   /auth/login          — [LoginPage]
///   /auth/coach-signup   — [CoachSignUpPage]
///   /auth/client-signup  — [ClientSignUpPage] (optional ?invite= query param)
///   /coach/dashboard     — placeholder (implement in coach shell feature)
///   /client/today        — placeholder (implement in client shell feature)
class AppRouter {
  AppRouter({required AuthBloc authBloc}) {
    _notifier = RouterNotifier(authBloc);
    router = GoRouter(
      initialLocation: '/auth/login',
      refreshListenable: _notifier,
      redirect: _guard,
      routes: _routes,
      errorBuilder: (context, state) =>
          Scaffold(body: Center(child: Text('Route not found: ${state.uri}'))),
    );
  }

  late final RouterNotifier _notifier;
  late final GoRouter router;

  // ── Guard ─────────────────────────────────────────────────────────────────

  String? _guard(BuildContext context, GoRouterState state) {
    return switch (_notifier.authState) {
      // Not authenticated → send to login (unless already on an auth route).
      Unauthenticated() || AuthError() =>
        state.matchedLocation.startsWith('/auth') ? null : '/auth/login',

      // In-flight → hold position (don't redirect while a request is pending).
      Authenticating() => null,

      // Coach authenticated → bounce off auth routes to dashboard.
      AuthenticatedCoach() =>
        state.matchedLocation.startsWith('/auth') ? '/coach/dashboard' : null,

      // Client authenticated → bounce off auth routes to today view.
      AuthenticatedClient() =>
        state.matchedLocation.startsWith('/auth') ? '/client/today' : null,
    };
  }

  // ── Routes ────────────────────────────────────────────────────────────────

  static final List<RouteBase> _routes = [
    // ── Auth routes ─────────────────────────────────────────────────────────
    GoRoute(
      path: '/auth/login',
      name: 'login',
      builder: (context, _) => const LoginPage(),
    ),
    GoRoute(
      path: '/auth/coach-signup',
      name: 'coach-signup',
      builder: (context, _) => const CoachSignUpPage(),
    ),
    GoRoute(
      path: '/auth/client-signup',
      name: 'client-signup',
      builder: (context, state) => ClientSignUpPage(
        // Accept ?invite=<code> query parameter from coach invite links.
        inviteCode: state.uri.queryParameters['invite'],
      ),
    ),

    // ── Coach shell ─────────────────────────────────────────────────────────
    ShellRoute(
      builder: (context, state, child) => CoachShellPage(child: child),
      routes: [
        GoRoute(
          path: '/coach/dashboard',
          name: 'coach-dashboard',
          builder: (context, _) => const _PlaceholderPage(
            icon: Icons.dashboard_rounded,
            label: 'Coach Dashboard',
            subtitle: 'Dashboard feature goes here.',
          ),
        ),
        GoRoute(
          path: '/coach/clients',
          name: 'coach-clients',
          builder: (context, _) => const _PlaceholderPage( // Replace with CoachClientsPage later
            icon: Icons.people,
            label: 'Clients List',
            subtitle: 'Clients list feature goes here.',
          ),
        ),
        GoRoute(
          path: '/coach/messages',
          name: 'coach-messages',
          builder: (context, _) => const ConversationsListPage(),
        ),
        GoRoute(
          path: '/coach/billing',
          name: 'coach-billing',
          builder: (context, _) => const BillingPage(),
        ),
      ],
    ),

    // ── Client shell ─────────────────────────────────────────────────────────
    ShellRoute(
      builder: (context, state, child) => ClientShellPage(child: child),
      routes: [
        GoRoute(
          path: '/client/today',
          name: 'client-today',
          builder: (context, _) => const ClientTodayPage(clientId: '',),
        ),
        GoRoute(
          path: '/client/progressions',
          name: 'client-progressions',
          builder: (context, _) => const ClientProgressionsPage(clientId: '',),
        ),
        GoRoute(
          path: '/client/messages',
          name: 'client-messages',
          builder: (context, _) => const _PlaceholderPage( // They only talk to the coach, could directly go to ChatThreadPage if we look up the coachId
            icon: Icons.message,
            label: 'Coach Messages',
            subtitle: 'Chat Thread here.',
          ),
        ),
      ],
    ),
  ];
}

// ── Placeholder page — remove when real shells are implemented ───────────────

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({
    required this.icon,
    required this.label,
    required this.subtitle,
  });

  final IconData icon;
  final String label;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 64, color: colorScheme.primary),
            const SizedBox(height: 16),
            Text(label, style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(color: colorScheme.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

