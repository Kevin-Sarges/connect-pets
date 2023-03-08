import 'package:connect_pets/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:connect_pets/app/features/splash/domain/repository/isplash_repository.dart';
import 'package:dartz/dartz.dart';

class SplashRepository implements SplashRepositoryImpl {
  final SplashDataSourceImpl dataSource;

  SplashRepository({required this.dataSource});

  @override
  Future<Either<bool, bool>> isLoggerIn() async {
    try {
      final result = await dataSource.isLoggerIn();

      if (result == true) {
        return const Right(true);
      } else {
        return const Left(false);
      }
    } catch (e) {
      return const Left(false);
    }
  }
}
