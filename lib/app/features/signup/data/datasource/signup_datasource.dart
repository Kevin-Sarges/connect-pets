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
  final _googleAuth = GoogleSignIn();

  @override
  Future<UserCredential> signupUserEmailPassword(UserModel userModel) async {
    try {
      final user = await _fireAuth.createUserWithEmailAndPassword(
        email: userModel.emailUser ?? "",
        password: userModel.passwordUser ?? "",
      );

      if (userModel.emailUser == null || userModel.passwordUser == null) {
        throw CommonNoDataFoundError(message: "Email ou senha vazios");
      } else if (userModel.emailUser == "" || userModel.passwordUser == "") {
        throw CommonNoDataFoundError(message: "Email ou senha vazios");
      }

      await _fireStore.collection("users").doc().set({
        'id_user': _uuid.v4(),
        'city_user': userModel.cityUser,
        'email_user': userModel.emailUser,
        'name_user': userModel.nameUser,
        'whatsapp_user': userModel.whatsappUser,
      });

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        throw CommonNoDataFoundError(message: "Senha muito curta");
      } else if (e.code == "email-already-in-use") {
        throw CommonNoDataFoundError(message: "Email já esta cadastrado");
      }

      throw CommonDesconhecidoError();
    }
  }

  @override
  Future<UserCredential> signupGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleAuth.signIn();
      final GoogleSignInAuthentication? googleAuthUser =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthUser?.accessToken,
        idToken: googleAuthUser?.idToken,
      );

      return await _fireAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
