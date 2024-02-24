import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class PerfilRepositoryImpl {
  Future<Either<Failure, UserEntity>> getInfoUser(String idUser);
  Future<Either<Failure, List<PostEntity>>> getPostsUser(String idUser);
  Future<Either<Failure, void>> editImageUser(String id, String? image);
  Future<Either<Failure, void>> editNameUser(String id, String name);
  Future<Either<Failure, void>> editWhatsapp(String id, String whatsapp);
}
