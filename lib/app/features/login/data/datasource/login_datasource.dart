import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/login/domain/datasource/ilogin_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginDataSource implements LoginDataSourceImpl {
  final firebaseAuth = FirebaseAuth.instance;
  final googleAuth = GoogleSignIn();
  final facebookAuth = FacebookAuth.instance;

  @override
  Future<UserCredential> signInWithFacebook() async {
    try {
      final loginUser = await facebookAuth.login();

      final facebookAuthCredential = FacebookAuthProvider.credential(
        loginUser.accessToken!.token,
      );

      final result = firebaseAuth.signInWithCredential(facebookAuthCredential);

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonNoInternetConnectionError(message: e.message);
    }
  }

  @override
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await googleAuth.signIn();
      final GoogleSignInAuthentication? googleAuthUser =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuthUser?.accessToken,
        idToken: googleAuthUser?.idToken,
      );

      final result = await firebaseAuth.signInWithCredential(credential);

      return result;
    } on FirebaseAuthException catch (e) {
      throw CommonNoInternetConnectionError(message: e.message);
    }
  }
}
