import 'package:connect_pets/app/features/splash/domain/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    SplashInjectDependency.init(getIt);
  }
}
