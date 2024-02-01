import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract interface class HomeRepositoryImpl {
  Future<Either<Failure, UserEntity>> userDetails(String id);
}