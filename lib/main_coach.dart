/// Entry point for the **Coach Dashboard** (Flutter Web target).
///
/// Target this file explicitly in CI:
///   flutter build web --target lib/main_coach.dart
library;

import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/core/routing/app_router.dart';
import 'package:ironlink/core/theme/app_theme.dart';
import 'package:ironlink/core/utils/constants.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env[AppConstants.envSupabaseUrl]!,
    // ignore: deprecated_member_use
    publishableKey: dotenv.env[AppConstants.envSupabasePublishableKey]!,
  );

  await configureDependencies();

  runApp(const CoachApp());
}

class CoachApp extends StatefulWidget {
  const CoachApp({super.key});

  @override
  State<CoachApp> createState() => _CoachAppState();
}

class _CoachAppState extends State<CoachApp> {
  late final AuthBloc _authBloc;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>();
    _appRouter = AppRouter(authBloc: _authBloc);
    // Subscribe to Supabase auth stream for the app's lifetime.
    _authBloc.add(const AuthEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: MaterialApp.router(
        title: 'Ascent — Coach',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: _appRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
