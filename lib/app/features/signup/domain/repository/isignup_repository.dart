import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class SignupRepositoryImpl {
  Future<Either<Failure, void>> signupUser(UserEntity user);
}