import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';

base class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeSuccess extends HomeState {
  UserEntity user;

  HomeSuccess(this.user);
}

final class HomeError extends HomeState {
  Failure error;

  HomeError(this.error);
}