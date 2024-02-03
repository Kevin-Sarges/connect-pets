import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/feed/domain/repository/ifeed_repository.dart';
import 'package:dartz/dartz.dart';

class LogoutUseCase {
  final FeedRepositoryImpl repositoryImpl;

  LogoutUseCase({required this.repositoryImpl});

  Future<Either<Failure, void>> call() async {
    return await repositoryImpl.logout();
  }
}