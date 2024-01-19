import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:dartz/dartz.dart';

class SignupUseCase {
  final SignupRepositoryImpl repositoryImpl;

  SignupUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(UserModel userModel) async {
    return await repositoryImpl.signupUserEmailPassword(userModel);
  }
}