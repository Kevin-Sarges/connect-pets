import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class SignupDatasource implements SignupDatasourceImpl {
  final _fireAuth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  @override
  Future<void> signupUser(UserEntity user) async {
    try {
      final credential = await _fireAuth.createUserWithEmailAndPassword(
        email: user.emailUser,
        password: user.passwordUser,
      );

      final userCredential = credential.user;

      await _fireStore.collection("user").add({
        'id_user': _uuid.v4(),
        'city_user': user.cityUser,
        'email_user': userCredential?.email,
        'name_user': user.nameUser,
        'password_user': user.passwordUser,
        'whatsapp_user': user.whatsappUser,
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
}
