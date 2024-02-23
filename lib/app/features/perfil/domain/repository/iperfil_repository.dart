import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class PerfilRepositoryImpl {
  Future<Either<Failure, UserEntity>> getInfoUser(String idUser);
  Future<Either<Failure, List<PostEntity>>> getPostsUser(String idUser);
  Future<Either<Failure, void>> editInfoUser(UserModel user);
}