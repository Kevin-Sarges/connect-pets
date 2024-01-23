import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/refactor_password/domain/datasource/irefactor_password_datasource.dart';
import 'package:connect_pets/app/features/refactor_password/domain/repository/irefactor_password_repository.dart';
import 'package:dartz/dartz.dart';

class RefactorPasswordRepository implements RefactorPasswordRepositoryImpl {
  final RefactorPasswordDataSourceImpl dataSourceImpl;

  RefactorPasswordRepository({required this.dataSourceImpl});

  @override
  Future<Either<Failure, void>> refactoryPassword(UserEntity user) async {
    try {
      final result = await dataSourceImpl.refactoryPassword(user);

      return Right(result);
    } on Failure catch(e) {
      return Left(e);
    }
  }
}