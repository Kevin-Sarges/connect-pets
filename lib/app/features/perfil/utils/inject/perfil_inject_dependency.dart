import 'package:connect_pets/app/features/perfil/data/datasource/perfil_datasource.dart';
import 'package:connect_pets/app/features/perfil/data/repository/perfil_repository.dart';
import 'package:connect_pets/app/features/perfil/domain/datasource/iperfil_datasource.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/get/get_perfil_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/get/get_posts_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_image_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_name_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_whatsapp_usecase.dart';
import 'package:connect_pets/app/features/perfil/presenter/cubit/perfil_cubit.dart';
import 'package:get_it/get_it.dart';

class PerfilInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<PerfilDatasourceImpl>(() => PerfilDatasource());

    getIt.registerFactory<PerfilRepositoryImpl>(
      () => PerfilRepository(datasourceImpl: getIt()),
    );

    getIt.registerFactory<GetInfoPerfilUseCase>(
      () => GetInfoPerfilUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<GetPostsUseCase>(
      () => GetPostsUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<UpdateWhatsappUseCase>(
      () => UpdateWhatsappUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<UpdateImageUseCase>(
      () => UpdateImageUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<UpdateNameUseCase>(
      () => UpdateNameUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<PerfilCubit>(
      () => PerfilCubit(
        getPostsUseCase: getIt(),
        getInfoPerfilUseCase: getIt(),
        updateImageUseCase: getIt(),
        updateNameUseCase: getIt(),
        updateWhatsappUseCase: getIt(),
      ),
    );
  }
}
