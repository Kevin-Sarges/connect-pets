import 'package:connect_pets/app/features/signup/data/datasource/signup_datasource.dart';
import 'package:connect_pets/app/features/signup/data/repository/signup_repository.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_user_case.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

class SignupInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<SignupDatasourceImpl>(() => SignupDatasource());

    getIt.registerFactory<SignupRepositoryImpl>(
      () => SignupRepository(
        datasourceImpl: getIt(),
      ),
    );

    getIt.registerFactory<SignupUseCase>(
      () => SignupUseCase(
        repositoryImpl: getIt(),
      ),
    );

    getIt.registerFactory(
      () => SignupCubit(
        signupUseCase: getIt(),
      ),
    );
  }
}
