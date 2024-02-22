import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupDatasource implements SignupDatasourceImpl {
  final _fireAuth = FirebaseAuth.instance;
  final _fireFirestore = FirebaseFirestore.instance;
  final _fireStore = FirebaseStorage.instance;
  final _googleAuth = GoogleSignIn();

  @override
  Future<UserCredential> signupUserEmailPassword(UserModel userModel) async {
    try {
      final imageFile = File(userModel.imageUser ?? "");
      final ref =
          "connect-pest/foto-perfil/img-${DateTime.now().toString()}-${userModel.nameUser}.jpg";
      final userCredential = await _fireAuth.createUserWithEmailAndPassword(
        email: userModel.emailUser ?? "",
        password: userModel.passwordUser ?? "",
      );

      final user = userCredential.user;
      final saveImage = await _fireStore.ref(ref).putFile(imageFile, SettableMetadata(
        contentType: "image/png",
      ));

      final imageUrl = await saveImage.ref.getDownloadURL();

      if (user != null) {
        await _fireFirestore.collection("users").doc(user.uid).set({
          'id_user': user.uid,
          'image_user': imageUrl,
          'city_user': userModel.cityUser,
          'email_user': userModel.emailUser,
          'name_user': userModel.nameUser,
          'whatsapp_user': userModel.whatsappUser,
        });

        return userCredential;
      } else {
        throw CommonNoDataFoundError();
      }
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
