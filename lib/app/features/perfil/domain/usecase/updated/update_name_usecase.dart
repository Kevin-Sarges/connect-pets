import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateNameUseCase {
  final PerfilRepositoryImpl repositoryImpl;

  UpdateNameUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(String id, String name) async {
    return await repositoryImpl.editNameUser(id, name);
  }
}