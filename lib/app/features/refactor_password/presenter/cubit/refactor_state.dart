import 'package:connect_pets/app/common/error/failure.dart';

base class RefactorPasswordState {}

final class RefactorPasswordInitial extends RefactorPasswordState {}

final class RefactorPasswordLoading extends RefactorPasswordState {}

final class RefactorPasswordSuccess extends RefactorPasswordState {}

final class RefactorPasswordError extends RefactorPasswordState {
  final Failure error;

  RefactorPasswordError(this.error);
}