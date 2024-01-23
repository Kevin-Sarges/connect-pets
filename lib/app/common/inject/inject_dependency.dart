import 'package:connect_pets/app/features/finish_signup/domain/inject/finish_inject_dependency.dart';
import 'package:connect_pets/app/features/login/domain/inject/login_inject_dependency.dart';
import 'package:connect_pets/app/features/refactor_password/domain/inject/refactor_inject_dependency.dart';
import 'package:connect_pets/app/features/signup/domain/inject/signup_inject_dependency.dart';
import 'package:connect_pets/app/features/splash/domain/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    SplashInjectDependency.init(getIt);
    SignupInjectDependency.init(getIt);
    FinishSignupInjectDependency.init(getIt);
    LoginInjecDependency.init(getIt);
    RefactorPasswordInjectDependency.init(getIt);
  }
}
