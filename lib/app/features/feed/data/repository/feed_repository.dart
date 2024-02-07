import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/feed/domain/datasource/ifeed_datasource.dart';
import 'package:connect_pets/app/features/feed/domain/repository/ifeed_repository.dart';
import 'package:dartz/dartz.dart';

class FeedRepository implements FeedRepositoryImpl {
  final FeedDataSourceImpl dataSourceImpl;

  FeedRepository({required this.dataSourceImpl});

  @override
  Future<Either<Failure, List<PostEntity>>> listPosts() async {
    try {
      final result = await dataSourceImpl.listPosts();

      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      final result = await dataSourceImpl.logout();

      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }
}