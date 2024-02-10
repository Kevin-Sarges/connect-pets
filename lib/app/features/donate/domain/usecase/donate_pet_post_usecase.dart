import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/features/donate/domain/repository/idonate_repository.dart';
import 'package:dartz/dartz.dart';

class DonatePetPostUseCase {
  final DonateRepositoryImpl repositoryImpl;

  DonatePetPostUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(PostModel post) async {
    return await repositoryImpl.donatePetPost(post);
  }
}