import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupEmailPasswordUseCase {
  final SignupRepositoryImpl repositoryImpl;

  SignupEmailPasswordUseCase({required this.repositoryImpl});

  Future<Either<Failure, UserCredential>> call(UserModel userModel) async {
    return await repositoryImpl.signupUserEmailPassword(userModel);
  }
}
