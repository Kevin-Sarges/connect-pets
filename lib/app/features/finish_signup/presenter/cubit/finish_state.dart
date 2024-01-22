import 'package:connect_pets/app/common/error/failure.dart';

abstract base class FinishSignupState {}

final class FinishSignupInitial extends FinishSignupState {}

final class FinishSignupLoading extends FinishSignupState {}

final class FinishSignupSuccess extends FinishSignupState {}

final class FinishSignupError extends FinishSignupState {
  Failure error;

  FinishSignupError(this.error);
}