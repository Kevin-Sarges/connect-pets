import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class FinishRepositoryImpl {
  Future<Either<Failure, void>> finishSignup(UserEntity user);
}