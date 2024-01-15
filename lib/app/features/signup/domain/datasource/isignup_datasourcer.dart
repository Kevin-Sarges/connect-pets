import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class SignupDatasourceImpl{
  Future<void> signupUser(UserEntity user);
}