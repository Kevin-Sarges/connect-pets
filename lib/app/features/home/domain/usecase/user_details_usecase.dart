import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetailsUseCase {
  final HomeRepositoryImpl repositoryImpl;

  UserDetailsUseCase({required this.repositoryImpl});

  Future<Either<Failure, User?>> call() async {
    return await repositoryImpl.userDetails();
  }
}