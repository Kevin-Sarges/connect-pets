import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:connect_pets/app/features/login/domain/repository/ilogin_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginRepository implements LoginRepositoryImpl {
  final LoginDataSourceImpl dataSourceImpl;

  LoginRepository({required this.dataSourceImpl});

  @override
  Future<Either<Failure, void>> signInEmailPassword(UserEntity user) async {
    try {
      final result = await dataSourceImpl.signInEmailPassword(user);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithFacebook() async {
    try {
      final result = await dataSourceImpl.signInWithFacebook();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final result = await dataSourceImpl.signInWithGoogle();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
