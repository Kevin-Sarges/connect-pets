import 'package:connect_pets/app/common/error/failure.dart';

base class DonateState {}

final class DonateInitial extends DonateState {}

final class DonateLoading extends DonateState {}

final class DonateSuccess extends DonateState {}

final class DonateError extends DonateState {
  Failure error;

  DonateError(this.error);
}