import 'package:connect_pets/app/common/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

base class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  User user;

  HomeSuccess(this.user);
}

final class HomeError extends HomeState {
  Failure error;

  HomeError(this.error);
}