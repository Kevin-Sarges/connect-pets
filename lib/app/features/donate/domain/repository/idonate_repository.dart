import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:dartz/dartz.dart';

abstract interface class DonateRepositoryImpl {
  Future<Either<Failure, void>> donatePetPost(PostModel post);
}