import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupGoogleUseCase {
  final SignupRepositoryImpl repositoryImpl;

  SignupGoogleUseCase({required this.repositoryImpl});

  Future<Either<Failure, UserCredential>> call() async {
    return repositoryImpl.signupGoogle();
  }
}