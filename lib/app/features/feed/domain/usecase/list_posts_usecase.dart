import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/feed/domain/repository/ifeed_repository.dart';
import 'package:dartz/dartz.dart';

class ListPostsUseCase {
  final FeedRepositoryImpl repositoryImpl;

  ListPostsUseCase({required this.repositoryImpl});

  Future<Either<Failure, List<PostEntity>>> call() async {
    return await repositoryImpl.listPosts();
  }
}