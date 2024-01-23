import 'package:connect_pets/app/features/refactor_password/data/datasource/refactor_password_datasource.dart';
import 'package:connect_pets/app/features/refactor_password/data/repository/refactor_password_repository.dart';
import 'package:connect_pets/app/features/refactor_password/domain/datasource/irefactor_password_datasource.dart';
import 'package:connect_pets/app/features/refactor_password/domain/repository/irefactor_password_repository.dart';
import 'package:connect_pets/app/features/refactor_password/domain/usecase/refactor_password_usecase.dart';
import 'package:connect_pets/app/features/refactor_password/presenter/cubit/refactor_password_cubit.dart';
import 'package:get_it/get_it.dart';

class RefactorPasswordInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<RefactorPasswordDataSourceImpl>(
      () => RefactorPasswordDataSource(),
    );

    getIt.registerFactory<RefactorPasswordRepositoryImpl>(
      () => RefactorPasswordRepository(dataSourceImpl: getIt()),
    );

    getIt.registerFactory<RefactorPasswordUseCase>(
      () => RefactorPasswordUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<RefactorPasswordCubit>(
      () => RefactorPasswordCubit(refactorPasswordUseCase: getIt()),
    );
  }
}
