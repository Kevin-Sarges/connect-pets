import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/post/domain/datasource/ipost_datasource.dart';
import 'package:connect_pets/app/features/post/domain/repository/ipost_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepository implements PostRepositoryImpl {
  final PostDataSourceImpl dataSource;

  PostRepository({required this.dataSource});

  @override
  Future<Either<Failure, void>> deletedPost(String id) async {
    try {
      final result = await dataSource.deletedPost(id);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> editPost(
    String? age,
    String? gender,
    String id,
  ) async {
    try {
      final result = await dataSource.editPost(age, gender, id);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
