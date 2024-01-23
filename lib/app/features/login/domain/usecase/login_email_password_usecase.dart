import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';

class LoginEmailPasswordUseCase {
  final LoginRepositoryImpl repositoryImpl;

  LoginEmailPasswordUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repositoryImpl.signInEmailPassword(user);
  }
}