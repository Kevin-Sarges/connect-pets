import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class FeedRepositoryImpl {
  Future<Either<Failure, List<PostEntity>>> listPosts();
  Future<Either<Failure, void>> logout();
}