import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:connect_pets/app/features/home/domain/repository/ihome_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeRepository implements HomeRepositoryImpl {
  final HomeDatasourceImpl datasourceImpl;

  HomeRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, User?>> userDetails() async {
    try {
      final result = await datasourceImpl.userDetails();

      return Right(result);
    } on CommonNoDataFoundError catch(e) {
      return Left(e);
    }
  }
}