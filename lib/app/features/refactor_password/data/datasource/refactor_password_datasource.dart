import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/refactor_password/domain/datasource/irefactor_password_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RefactorPasswordDataSource implements RefactorPasswordDataSourceImpl {
  final _fireAuth = FirebaseAuth.instance;

  @override
  Future<void> refactoryPassword(UserEntity user) async {
    try {
      await _fireAuth.sendPasswordResetEmail(email: user.emailUser ?? "");
    } on FirebaseAuthException catch(e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}