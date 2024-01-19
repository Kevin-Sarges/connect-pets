import 'package:connect_pets/app/common/model/user_model.dart';

abstract interface class SignupDatasourceImpl{
  Future<void> signupUserEmailPassword(UserModel userModel);
}