import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/post/domain/repository/ipost_repository.dart';
import 'package:dartz/dartz.dart';

class DeletedPostUseCase {
  final PostRepositoryImpl repository;

  DeletedPostUseCase({required this.repository});

  Future<Either<Failure, void>> call(String id) async {
    return await repository.deletedPost(id);
  }
}