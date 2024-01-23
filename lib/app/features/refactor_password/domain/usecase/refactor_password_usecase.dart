import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/refactor_password/domain/repository/irefactor_password_repository.dart';
import 'package:dartz/dartz.dart';

class RefactorPasswordUseCase {
  final RefactorPasswordRepositoryImpl repositoryImpl;

  RefactorPasswordUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repositoryImpl.refactoryPassword(user);
  }
}
