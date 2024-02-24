import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateImageUseCase {
  final PerfilRepositoryImpl repositoryImpl;

  UpdateImageUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(String id, String? image) async {
    return await repositoryImpl.editImageUser(id, image!);
  }
}