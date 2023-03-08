import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:connect_pets/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dartz/dartz.dart';

class SplashRepository implements SplashRepositoryImpl {
  final SplashDataSourceImpl dataSource;

  SplashRepository({required this.dataSource});

  @override
  Future<Either<Failure?, User?>> isLoggerIn() async {
    try {
      final result = await dataSource.isLoggerIn();

      if (result != null) {
        return Right(result);
      } else {
        return const Left(null);
      }
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
