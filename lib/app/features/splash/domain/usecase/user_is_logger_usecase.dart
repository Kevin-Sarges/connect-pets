import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserIsLoggerUsecase {
  final SplashRepositoryImpl repository;

  UserIsLoggerUsecase({required this.repository});

  Future<Either<Failure?, User?>> call() async {
    return await repository.isLoggerIn();
  }
}
