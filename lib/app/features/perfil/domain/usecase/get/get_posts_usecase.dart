import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class GetPostsUseCase {
  final PerfilRepositoryImpl repositoryImpl;

  GetPostsUseCase({required this.repositoryImpl});

  Future<Either<Failure, List<PostEntity>>> call(String idUser) async {
    return await repositoryImpl.getPostsUser(idUser);
  }
}