import 'package:connect_pets/app/features/finish_signup/data/datasource/finish_signup_datasource.dart';
import 'package:connect_pets/app/features/finish_signup/data/repository/finish_signup_repository.dart';
import 'package:connect_pets/app/features/finish_signup/domain/datasource/ifinish_datasource.dart';
import 'package:connect_pets/app/features/finish_signup/domain/repository/ifinish_repository.dart';
import 'package:connect_pets/app/features/finish_signup/domain/usecase/finish_signup_usecase.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_cubit.dart';
import 'package:get_it/get_it.dart';

class FinishSignupInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<FinishDataSourceImpl>(
      () => FinishDataSource(),
    );

    getIt.registerFactory<FinishRepositoryImpl>(
      () => FinishRepository(dataSourceImpl: getIt()),
    );

    getIt.registerFactory<FinishSignupUseCase>(
      () => FinishSignupUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<FinishCubit>(
      () => FinishCubit(finishSignupUseCase: getIt()),
    );
  }
}
