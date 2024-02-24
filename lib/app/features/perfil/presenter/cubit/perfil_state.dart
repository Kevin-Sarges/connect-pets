import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';

base class PerfilState {}

final class PerfilInitial extends PerfilState {}

final class PerfilLoading extends PerfilState {}

final class InfoUser extends PerfilState {
  final UserEntity user;

  InfoUser(this.user);
}

final class ListPost extends PerfilState {
  final List<PostEntity> post;

  ListPost(this.post);
}

final class PerfilUpdatedSuccess extends PerfilState {}

final class PerfilError extends PerfilState {
  final Failure error;

  PerfilError(this.error);
}
