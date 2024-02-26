import 'package:connect_pets/app/features/post/data/datasource/post_datasource.dart';
import 'package:connect_pets/app/features/post/data/repository/post_repository.dart';
import 'package:connect_pets/app/features/post/domain/datasource/ipost_datasource.dart';
import 'package:connect_pets/app/features/post/domain/repository/ipost_repository.dart';
import 'package:connect_pets/app/features/post/domain/usecase/deleted_post_usecase.dart';
import 'package:connect_pets/app/features/post/domain/usecase/edit_post_usecase.dart';
import 'package:connect_pets/app/features/post/presenter/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';

class PostInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<PostDataSourceImpl>(() => PostDataSource());

    getIt.registerFactory<PostRepositoryImpl>(
      () => PostRepository(dataSource: getIt()),
    );

    getIt.registerFactory<EditPostUseCase>(
      () => EditPostUseCase(repository: getIt()),
    );

    getIt.registerFactory<DeletedPostUseCase>(
      () => DeletedPostUseCase(repository: getIt()),
    );

    getIt.registerFactory<PostCubit>(
      () => PostCubit(
        deletedPostUseCase: getIt(),
        editPostUseCase: getIt(),
      ),
    );
  }
}
