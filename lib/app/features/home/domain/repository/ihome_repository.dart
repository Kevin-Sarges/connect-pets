import 'package:connect_pets/app/common/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class HomeRepositoryImpl {
  Future<Either<Failure, User?>> userDetails();
}