import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupRepository implements SignupRepositoryImpl {
  final SignupDatasourceImpl datasourceImpl;

  SignupRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, UserCredential>> signupUserEmailPassword(
    UserModel userModel,
  ) async {
    try {
      final result = await datasourceImpl.signupUserEmailPassword(userModel);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signupGoogle() async {
    try {
      final result = await datasourceImpl.signupGoogle();

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
