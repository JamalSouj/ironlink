import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// ignore: always_use_package_imports
import 'injection.config.dart'; // generated file — relative import required by injectable_generator

/// The global service locator instance.
/// Access dependencies via [getIt<T>()].
final GetIt getIt = GetIt.instance;

/// Bootstrap all injectable dependencies.
///
/// Call this once in each entry-point (`main_coach.dart`, `main_client.dart`)
/// before `runApp`. The [environment] parameter allows switching between
/// `Environment.prod`, `Environment.dev`, and `Environment.test`.
@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies({
  String environment = Environment.prod,
}) async {
  getIt.init(environment: environment);
}
