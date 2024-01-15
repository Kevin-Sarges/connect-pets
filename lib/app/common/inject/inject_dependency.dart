import 'package:connect_pets/app/features/login/domain/inject/login_inject_dependency.dart';
import 'package:connect_pets/app/features/signup/domain/inject/signup_inject_dependency.dart';
import 'package:connect_pets/app/features/splash/domain/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    SplashInjectDependency.init(getIt);
    LoginInjecDependency.init(getIt);
    SignupInjectDependency.init(getIt);
  }
}
