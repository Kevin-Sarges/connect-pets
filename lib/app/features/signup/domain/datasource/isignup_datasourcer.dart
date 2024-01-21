import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SignupDatasourceImpl{
  Future<void> signupUserEmailPassword(UserModel userModel);
  Future<UserCredential> signupGoogle();
}