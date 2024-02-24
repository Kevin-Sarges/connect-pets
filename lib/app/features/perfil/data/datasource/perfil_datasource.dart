import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/perfil/domain/datasource/iperfil_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PerfilDatasource implements PerfilDatasourceImpl {
  final _firebase = FirebaseFirestore.instance;
  final _fireStore = FirebaseStorage.instance;

  @override
  Future<UserEntity> getInfoUser(String idUser) async {
    try {
      final getUsers = await _firebase
          .collection("users")
          .where("id_user", isEqualTo: idUser)
          .get();

      final result = getUsers.docs.map((doc) {
        final data = doc.data();

        return UserModel.fromJson(data);
      });

      return result.first;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<List<PostEntity>> getPostsUser(String idUser) async {
    try {
      final getPostsUser = await _firebase
          .collection("posts")
          .where('user_id', isEqualTo: idUser)
          .get();

      final result = getPostsUser.docs.map((doc) {
        final data = doc.data();

        return PostModel.fromJson(data);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<void> editImageUser(String id, String? image) async {
    try {
      final imageFile = File(image!);
      final ref =
          "connect-pest/foto-perfil/img-${DateTime.now().toString()}-$id.jpg";

      final saveImage = await _fireStore.ref(ref).putFile(
            imageFile,
            SettableMetadata(
              contentType: "image/png",
            ),
          );

      final imageUrl = await saveImage.ref.getDownloadURL();

      await _firebase.collection("users").doc(id).update({
        "image_user": imageUrl,
      });

      final posts = await _firebase
          .collection("posts")
          .where("user_id", isEqualTo: id)
          .get();

      posts.docs.forEach((doc) {
        _firebase.collection("posts").doc(doc.id).update({
          "photo_user": imageUrl,
        });
      });
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<void> editNameUser(String id, String name) async {
    try {
      await _firebase.collection("users").doc(id).update({"name_user": name});

      final posts = await _firebase
          .collection("posts")
          .where("user_id", isEqualTo: id)
          .get();

      posts.docs.forEach((doc) {
        _firebase.collection("posts").doc(doc.id).update({"name_user": name});
      });
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }

  @override
  Future<void> editWhatsapp(String id, String whatsapp) async {
    try {
      await _firebase.collection("users").doc(id).update({
        "whatsapp_user": whatsapp,
      });

      final posts = await _firebase
          .collection("posts")
          .where("user_id", isEqualTo: id)
          .get();

      posts.docs.forEach((doc) {
        _firebase.collection("posts").doc(doc.id).update({
          "whatsapp": whatsapp,
        });
      });
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
