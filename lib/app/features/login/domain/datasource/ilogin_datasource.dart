import 'package:firebase_auth/firebase_auth.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';

abstract interface class LoginDataSourceImpl {
  Future<void> signInEmailPassword(UserEntity user);
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}
