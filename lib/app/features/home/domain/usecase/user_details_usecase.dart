import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';

class UserDetailsUseCase {
  final HomeRepositoryImpl repositoryImpl;

  UserDetailsUseCase({required this.repositoryImpl});

  Future<Either<Failure, UserEntity>> call(String id) async {
    return await repositoryImpl.userDetails(id);
  }
}