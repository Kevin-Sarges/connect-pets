import 'package:connect_pets/app/common/error/failure.dart';

base class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostDeletedSuccess extends PostState {}

final class PostUpdatedSuccess extends PostState {}

final class PostError extends PostState {
  final Failure error;

  PostError(this.error);
}
