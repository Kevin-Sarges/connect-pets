import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class HomeDatasourceImpl {
  Future<UserEntity> userDetails(String id);
}