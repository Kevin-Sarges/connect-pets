import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeDatasource implements HomeDatasourceImpl {
  final _firefireStore = FirebaseFirestore.instance;

  @override
  Future<UserEntity> userDetails(String id) async {
    try {
      final filterUser = await _firefireStore
          .collection("users")
              .where("id_user", isEqualTo: id).get();

      final user = filterUser.docs.map((e) {
        final data = e.data();

        return UserEntity(
          imageUser: data['image_user'],
          emailUser: data['email_user'],
          nameUser: data['name_user'],
          whatsappUser: data['whatsapp_user'],
          cityUser: data['city_user'],
        );
      }).toList().first;

      return user;
    } on FirebaseAuthException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
