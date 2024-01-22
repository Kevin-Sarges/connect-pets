import 'package:connect_pets/app/features/splash/data/datasource/splash_datasource.dart';
import 'package:connect_pets/app/features/splash/data/repository/splash_repository.dart';
import 'package:connect_pets/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:connect_pets/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:connect_pets/app/features/splash/domain/usecase/user_is_logger_usecase.dart';
import 'package:connect_pets/app/features/splash/presenter/cubit/splash_cubit.dart';
import 'package:get_it/get_it.dart';

class SplashInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<SplashDataSourceImpl>(
      () => SplashDataSource(),
    );

    getIt.registerFactory<SplashRepositoryImpl>(
      () => SplashRepository(dataSource: getIt()),
    );

    getIt.registerFactory<UserIsLoggerUsecase>(
      () => UserIsLoggerUsecase(repository: getIt()),
    );

    getIt.registerFactory<SplashCubit>(
      () => SplashCubit(userIsLoggerUsecase: getIt()),
    );
  }
}
