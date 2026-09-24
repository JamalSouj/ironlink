/// Default entry point — mirrors coach entry for `flutter run` with no -t flag.
library;

import 'package:ascent/core/di/injection.dart';
import 'package:ascent/core/routing/app_router.dart';
import 'package:ascent/core/theme/app_theme.dart';
import 'package:ascent/core/utils/constants.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_event.dart';
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

  runApp(const _DefaultApp());
}

class _DefaultApp extends StatefulWidget {
  const _DefaultApp();

  @override
  State<_DefaultApp> createState() => _DefaultAppState();
}

class _DefaultAppState extends State<_DefaultApp> {
  late final AuthBloc _authBloc;
  late final AppRouter _appRouter;

  @override
  void initState() {
    super.initState();
    _authBloc = getIt<AuthBloc>();
    _appRouter = AppRouter(authBloc: _authBloc);
    _authBloc.add(const AuthEvent.started());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _authBloc,
      child: MaterialApp.router(
        title: 'Ascent',
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerConfig: _appRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
