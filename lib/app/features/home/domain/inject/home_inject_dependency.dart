import 'package:connect_pets/app/features/home/data/datasource/home_datasource.dart';
import 'package:connect_pets/app/features/home/data/repository/home_repository.dart';
import 'package:connect_pets/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:connect_pets/app/features/home/domain/repository/ihome_repository.dart';
import 'package:connect_pets/app/features/home/domain/usecase/user_details_usecase.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';

class HomeInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<HomeDatasourceImpl>(() => HomeDatasource());

    getIt.registerFactory<HomeRepositoryImpl>(
      () => HomeRepository(datasourceImpl: getIt()),
    );

    getIt.registerFactory<UserDetailsUseCase>(
      () => UserDetailsUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<HomeCubit>(
      () => HomeCubit(userDetailsUseCase: getIt()),
    );
  }
}
