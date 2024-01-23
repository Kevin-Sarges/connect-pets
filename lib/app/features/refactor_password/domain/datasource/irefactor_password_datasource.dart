import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class RefactorPasswordDataSourceImpl {
  Future<void> refactoryPassword(UserEntity user);
}