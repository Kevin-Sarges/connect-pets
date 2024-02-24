import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class PerfilDatasourceImpl {
  Future<UserEntity> getInfoUser(String idUser);
  Future<List<PostEntity>> getPostsUser(String idUser);
  Future<void> editImageUser(String id, String? image);
  Future<void> editNameUser(String id, String name);
  Future<void> editWhatsapp(String id, String whatsapp);
}