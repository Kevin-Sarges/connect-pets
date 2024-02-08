import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class HomeDatasourceImpl {
  Future<UserEntity> userDetails(String id);
}