import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/datasource/iperfil_datasource.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class PerfilRepository implements PerfilRepositoryImpl {
  final PerfilDatasourceImpl datasourceImpl;

  PerfilRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, UserEntity>> getInfoUser(String idUser) async {
    try {
      final result = await datasourceImpl.getInfoUser(idUser);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, List<PostEntity>>> getPostsUser(String idUser) async {
    try {
      final result = await datasourceImpl.getPostsUser(idUser);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> editImageUser(String id, String? image) async {
    try {
      final result = await datasourceImpl.editImageUser(id, image!);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> editNameUser(String id, String name) async {
    try {
      final result = await datasourceImpl.editNameUser(id, name);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, void>> editWhatsapp(String id, String whatsapp) async {
    try {
      final result = await datasourceImpl.editWhatsapp(id, whatsapp);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
