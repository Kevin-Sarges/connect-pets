import 'package:dartz/dartz.dart';

abstract class SplashRepositoryImpl {
  Future<Either<bool, bool>> isLoggerIn();
}
