import 'package:connect_pets/app/features/feed/data/datasource/feed_datasource.dart';
import 'package:connect_pets/app/features/feed/data/repository/feed_repository.dart';
import 'package:connect_pets/app/features/feed/domain/datasource/ifeed_datasource.dart';
import 'package:connect_pets/app/features/feed/domain/repository/ifeed_repository.dart';
import 'package:connect_pets/app/features/feed/domain/usecase/list_posts_usecase.dart';
import 'package:connect_pets/app/features/feed/domain/usecase/logout_usecase.dart';
import 'package:connect_pets/app/features/feed/presenter/cubit/feed_cubit.dart';
import 'package:get_it/get_it.dart';

class FeedInjectDependency {
  static void init(GetIt getIt) {
    getIt.registerFactory<FeedDataSourceImpl>(() => FeedDatasource());

    getIt.registerFactory<FeedRepositoryImpl>(
      () => FeedRepository(dataSourceImpl: getIt()),
    );

    getIt.registerFactory<ListPostsUseCase>(
      () => ListPostsUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<LogoutUseCase>(
      () => LogoutUseCase(repositoryImpl: getIt()),
    );

    getIt.registerFactory<FeedCubit>(
      () => FeedCubit(
        logoutUseCase: getIt(),
        listPostsUseCase: getIt(),
      ),
    );
  }
}
