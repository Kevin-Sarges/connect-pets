import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/post/domain/repository/ipost_repository.dart';
import 'package:dartz/dartz.dart';

class EditPostUseCase {
  final PostRepositoryImpl repository;

  EditPostUseCase({required this.repository});

  Future<Either<Failure, void>> call(
    String? age,
    String? gender,
    String id,
  ) async {
    return await repository.editPost(age, gender, id);
  }
}
