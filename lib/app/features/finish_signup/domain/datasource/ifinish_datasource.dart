import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class FinishDataSourceImpl {
  Future<void> finishSignup(UserEntity user);
}