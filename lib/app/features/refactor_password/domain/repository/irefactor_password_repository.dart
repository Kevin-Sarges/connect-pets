import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class RefactorPasswordRepositoryImpl {
  Future<Either<Failure, void>> refactoryPassword(UserEntity user);
}