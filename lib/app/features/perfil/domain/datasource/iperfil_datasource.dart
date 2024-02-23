import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/model/user_model.dart';

abstract interface class PerfilDatasourceImpl {
  Future<UserEntity> getInfoUser(String idUser);
  Future<List<PostEntity>> getPostsUser(String idUser);
  Future<void> editInfoUser(UserModel user);
}