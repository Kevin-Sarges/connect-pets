import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class SignupRepositoryImpl {
  Future<Either<Failure, void>> signupUser(UserModel userModel);
}