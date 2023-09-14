import 'package:firebase_auth/firebase_auth.dart';

abstract interface class LoginDataSourceImpl {
  Future<UserCredential> signInWithGoogle();
  Future<UserCredential> signInWithFacebook();
}
