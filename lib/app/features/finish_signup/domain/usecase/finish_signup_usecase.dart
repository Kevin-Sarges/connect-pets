import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/finish_signup/domain/repository/ifinish_repository.dart';
import 'package:dartz/dartz.dart';

class FinishSignupUseCase {
  final FinishRepositoryImpl repositoryImpl;

  FinishSignupUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call(UserEntity user) async {
    return await repositoryImpl.finishSignup(user);
  }
}