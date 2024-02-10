import 'package:connect_pets/app/features/donate/utils/inject/donate_inject_dependency.dart';
import 'package:connect_pets/app/features/feed/utils/inject/feed_inject_dependency.dart';
import 'package:connect_pets/app/features/finish_signup/utils/inject/finish_inject_dependency.dart';
import 'package:connect_pets/app/features/home/utils/inject/home_inject_dependency.dart';
import 'package:connect_pets/app/features/login/utils/inject/login_inject_dependency.dart';
import 'package:connect_pets/app/features/refactor_password/utils/inject/refactor_inject_dependency.dart';
import 'package:connect_pets/app/features/signup/utils/inject/signup_inject_dependency.dart';
import 'package:connect_pets/app/features/splash/utils/inject/splash_inject.dart';
import 'package:get_it/get_it.dart';

class InjectDependency {
  static void init() {
    final getIt = GetIt.instance;

    SplashInjectDependency.init(getIt);
    SignupInjectDependency.init(getIt);
    FinishSignupInjectDependency.init(getIt);
    LoginInjecDependency.init(getIt);
    RefactorPasswordInjectDependency.init(getIt);
    HomeInjectDependency.init(getIt);
    FeedInjectDependency.init(getIt);
    DonateInjectDependency.init(getIt);
  }
}
