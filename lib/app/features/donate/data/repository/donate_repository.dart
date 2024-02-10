import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/features/donate/domain/datasource/idonate_datasource.dart';
import 'package:connect_pets/app/features/donate/domain/repository/idonate_repository.dart';
import 'package:dartz/dartz.dart';

class DonateRepository implements DonateRepositoryImpl {
  final DonateDatasourceImpl datasourceImpl;

  DonateRepository({required this.datasourceImpl});

  @override
  Future<Either<Failure, void>> donatePetPost(PostModel post) async {
    try {
      final result = await datasourceImpl.donatePetPost(post);

      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
