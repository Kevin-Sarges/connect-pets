import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/finish_signup/domain/datasource/ifinish_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class FinishDataSource implements FinishDataSourceImpl {
  final _fireStore = FirebaseFirestore.instance;
  final _fireAuth = FirebaseAuth.instance;

  @override
  Future<void> finishSignup(UserEntity user) async {
    try {
      final userEmail = _fireAuth.currentUser?.email;
      await _fireAuth.currentUser?.updatePassword(user.passwordUser ?? "");

      if(user.passwordUser == null || user.passwordUser == "") {
        throw CommonNoDataFoundError(message: "Senha Invalida");
      }

      await _fireStore.collection("users").doc().set({
        'id_user': _uuid.v4(),
        'city_user': user.cityUser,
        'email_user': userEmail,
        'name_user': user.nameUser,
        'whatsapp_user': user.whatsappUser,
      });
    } on FirebaseException catch(e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}