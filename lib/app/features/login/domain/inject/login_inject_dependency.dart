import 'package:connect_pets/app/features/login/data/datasource/login_datasource.dart';
import 'package:connect_pets/app/features/login/data/repository/login_repository.dart';
import 'package:connect_pets/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:connect_pets/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_facebook_usecase.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_google_usecase.dart';
import 'package:connect_pets/app/features/login/presenter/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

class LoginInjecDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<LoginDataSourceImpl>(
      () => LoginDataSource(),
    );

    getIt.registerFactory<LoginReposiotryImpl>(
      () => LoginRepositort(dataSourceImpl: getIt()),
    );

    getIt.registerFactory<LoginFacebookUseCase>(
      () => LoginFacebookUseCase(reposiotryImpl: getIt()),
    );

    getIt.registerFactory<LoginGoogleUseCase>(
      () => LoginGoogleUseCase(reposiotryImpl: getIt()),
    );

    getIt.registerFactory<LoginCubit>(
      () => LoginCubit(
        loginFacebookUseCase: getIt(),
        loginGoogleUseCase: getIt(),
      ),
    );
  }
}
