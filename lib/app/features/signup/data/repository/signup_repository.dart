import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:dartz/dartz.dart';

class SignupRepository implements SignupRepositoryImpl {
  final SignupDatasourceImpl datasourceImpl;

  SignupRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, void>> signupUser(UserEntity user) async {
    try {
      final result = await datasourceImpl.signupUser(user);

      return Right(result);
    } on CommonNoDataFoundError catch(e) {
      return Left(e);
    }
  }
}