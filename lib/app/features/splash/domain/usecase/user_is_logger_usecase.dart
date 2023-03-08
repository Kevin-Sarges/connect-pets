import 'package:connect_pets/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:dartz/dartz.dart';

class UserIsLoggerUsecase {
  final SplashRepositoryImpl repository;

  UserIsLoggerUsecase({required this.repository});

  Future<Either<bool, bool>> call() async {
    return await repository.isLoggerIn();
  }
}
