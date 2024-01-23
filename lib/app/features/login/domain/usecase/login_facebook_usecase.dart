import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginFacebookUseCase {
  final LoginRepositoryImpl repositoryImpl;

  LoginFacebookUseCase({required this.repositoryImpl});

  Future<Either<Failure, UserCredential>> call() async {
    return await repositoryImpl.signInWithFacebook();
  }
}
