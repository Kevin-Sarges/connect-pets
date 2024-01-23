import 'package:connect_pets/app/common/error/failure.dart';

base class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginError extends LoginState {
  final Failure error;

  LoginError(this.error);
}
