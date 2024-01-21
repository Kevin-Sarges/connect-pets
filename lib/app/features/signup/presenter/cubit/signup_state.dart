import 'package:connect_pets/app/common/error/failure.dart';

abstract base class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupEmailPassWordSuccess extends SignupState {}

final class SignupError extends SignupState {
  Failure error;

  SignupError(this.error);
}