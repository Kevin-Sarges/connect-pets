import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:connect_pets/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDatasourceImpl datasourceImpl;

  HomeRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, UserEntity>> userDetails(String id) async {
    try {
      final result = await datasourceImpl.userDetails(id);

      return Right(result);
    } on CommonNoDataFoundError catch(e) {
      return Left(e);
    }
  }
}