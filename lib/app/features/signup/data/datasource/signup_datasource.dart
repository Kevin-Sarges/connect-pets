import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class SignupDatasource implements SignupDatasourceImpl {
  final _fireAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<void> signupUserEmailPassword(UserModel userModel) async {
    try {
      await _fireAuth.createUserWithEmailAndPassword(
        email: userModel.emailUser,
        password: userModel.passwordUser,
      );

      await _fireStore.collection("users").doc().set({
        'id_user': _uuid.v4(),
        'city_user': userModel.cityUser,
        'email_user': userModel.emailUser,
        'name_user': userModel.nameUser,
        'password_user': userModel.passwordUser,
        'whatsapp_user': userModel.whatsappUser,
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw CommonNoDataFoundError(message: e.message);
      } else if (e.code == "email-already-in-use") {
        throw CommonNoDataFoundError(message: e.message);
      }

      throw CommonNoDataFoundError(message: e.message);
    }
  }

  @override
  Future<UserCredential> signupGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final response = _fireAuth.signInWithCredential(credential);

      return response;
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
