import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ironlink/core/routing/router_notifier.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/auth/presentation/pages/client_sign_up_page.dart';
import 'package:ironlink/features/auth/presentation/pages/coach_sign_up_page.dart';
import 'package:ironlink/features/auth/presentation/pages/login_page.dart';
import 'package:ironlink/features/billing/presentation/pages/billing_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/client_shell_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/coach_dashboard_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/coach_shell_page.dart';
import 'package:ironlink/features/coaching/presentation/pages/roster_page.dart';
import 'package:ironlink/features/exercises/presentation/pages/exercises_page.dart';
import 'package:ironlink/features/messaging/presentation/pages/client_messages_page.dart';
import 'package:ironlink/features/messaging/presentation/pages/conversations_list_page.dart';
import 'package:ironlink/features/programs/presentation/pages/client_today_page.dart';
import 'package:ironlink/features/programs/presentation/pages/program_builder_page.dart';
import 'package:ironlink/features/progressions/presentation/pages/client_progressions_page.dart';

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
          builder: (context, _) => const CoachDashboardPage(),
        ),
        GoRoute(
          path: '/coach/clients',
          name: 'coach-clients',
          builder: (context, _) => const RosterPage(),
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
        GoRoute(
          path: '/coach/exercises',
          name: 'coach-exercises',
          builder: (context, _) => const ExercisesPage(),
        ),
        GoRoute(
          path: '/coach/program-builder/:id',
          name: 'program-builder',
          builder: (context, state) {
            final id = state.pathParameters['id']!;
            return ProgramBuilderPage(programId: id);
          },
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
          builder: (context, _) {
            final authState = context.read<AuthBloc>().state;
            final clientId =
                authState is AuthenticatedClient ? authState.user.id : '';
            return ClientTodayPage(clientId: clientId);
          },
        ),
        GoRoute(
          path: '/client/progressions',
          name: 'client-progressions',
          builder: (context, _) {
            final authState = context.read<AuthBloc>().state;
            final clientId =
                authState is AuthenticatedClient ? authState.user.id : '';
            return ClientProgressionsPage(clientId: clientId);
          },
        ),
        GoRoute(
          path: '/client/messages',
          name: 'client-messages',
          builder: (context, _) => const ClientMessagesPage(),
        ),
      ],
    ),
  ];
}
