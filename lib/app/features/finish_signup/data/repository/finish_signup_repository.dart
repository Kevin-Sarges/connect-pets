import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/finish_signup/domain/datasource/ifinish_datasource.dart';
import 'package:connect_pets/app/features/finish_signup/domain/repository/ifinish_repository.dart';
import 'package:dartz/dartz.dart';

class FinishRepository implements FinishRepositoryImpl {
  final FinishDataSourceImpl dataSourceImpl;

  FinishRepository({required this.dataSourceImpl});

  @override
  Future<Either<Failure, void>> finishSignup(UserEntity user) async {
    try {
      final result = await dataSourceImpl.finishSignup(user);

      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }
}