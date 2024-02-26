import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class PostRepositoryImpl {
  Future<Either<Failure, void>> editPost(
    String? age,
    String? gender,
    String id,
  );
  Future<Either<Failure, void>> deletedPost(String id);
}
