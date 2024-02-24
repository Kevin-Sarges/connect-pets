import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class GetInfoPerfilUseCase {
  final PerfilRepositoryImpl repositoryImpl;

  GetInfoPerfilUseCase({required this.repositoryImpl});

  Future<Either<Failure, UserEntity>> call(String idUser) async {
    return await repositoryImpl.getInfoUser(idUser);
  }
}