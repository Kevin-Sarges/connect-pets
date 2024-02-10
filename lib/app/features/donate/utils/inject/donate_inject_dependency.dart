import 'package:connect_pets/app/features/donate/data/datasource/donate_datasource.dart';
import 'package:connect_pets/app/features/donate/data/repository/donate_repository.dart';
import 'package:connect_pets/app/features/donate/domain/datasource/idonate_datasource.dart';
import 'package:connect_pets/app/features/donate/domain/repository/idonate_repository.dart';
import 'package:connect_pets/app/features/donate/domain/usecase/donate_pet_post_usecase.dart';
import 'package:connect_pets/app/features/donate/presenter/cubit/donate_cubit.dart';
import 'package:get_it/get_it.dart';

class DonateInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<DonateDatasourceImpl>(() => DonateDatasource());

    getIt.registerFactory<DonateRepositoryImpl>(
      () => DonateRepository(datasourceImpl: getIt()),
    );

    getIt.registerFactory<DonatePetPostUseCase>(
      () => DonatePetPostUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<DonateCubit>(
      () => DonateCubit(donatePetPostUseCase: getIt()),
    );
  }
}
