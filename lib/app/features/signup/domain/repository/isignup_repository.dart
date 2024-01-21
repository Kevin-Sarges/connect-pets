import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignupRepositoryImpl {
  Future<Either<Failure, void>> signupUserEmailPassword(UserModel userModel);
  Future<Either<Failure, UserCredential>> signupGoogle();
}