import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginDataSource implements LoginDataSourceImpl {
  final _firebaseAuth = FirebaseAuth.instance;
  final _googleAuth = GoogleSignIn();
  final _facebookAuth = FacebookAuth.instance;

  @override
  Future<void> signInEmailPassword(UserEntity user) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: user.emailUser ?? "",
        password: user.passwordUser ?? "",
      );

      if (user.emailUser == null || user.emailUser == "") {
        throw CommonNoDataFoundError();
      } else if (user.passwordUser == null || user.passwordUser == "") {
        throw CommonNoDataFoundError();
      }
    } on FirebaseAuthException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithFacebook() async {
    try {
      final loginUser = await _facebookAuth.login();

      final facebookAuthCredential = FacebookAuthProvider.credential(
        loginUser.accessToken!.token,
      );

      final result = _firebaseAuth.signInWithCredential(facebookAuthCredential);

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonNoInternetConnectionError(message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleAuth.signIn();
      final GoogleSignInAuthentication? googleAuthUser =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthUser?.accessToken,
        idToken: googleAuthUser?.idToken,
      );

      final result = await _firebaseAuth.signInWithCredential(credential);

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonNoInternetConnectionError(message: e.message);
    }
  }
}
