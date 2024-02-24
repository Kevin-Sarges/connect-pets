import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/perfil/domain/repository/iperfil_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateWhatsappUseCase {
  final PerfilRepositoryImpl repositoryImpl;

  UpdateWhatsappUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(String id, String whatsapp) async {
    return await repositoryImpl.editWhatsapp(id, whatsapp);
  }
}
