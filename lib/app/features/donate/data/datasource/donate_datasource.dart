import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/features/donate/domain/datasource/idonate_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;

const uuid = Uuid();

class DonateDatasource implements DonateDatasourceImpl {
  final _firebase = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;
  final _auth = FirebaseAuth.instance;
  final _postId = uuid.v4();
  final _now = DateTime.now();

  @override
  Future<void> donatePetPost(PostModel post) async {
    try {
      final regExp = RegExp(r"[()]");
      final userId = _auth.currentUser?.uid;
      final imageFile = File(post.urlImage ?? "");
      final ref =
          "connect-pest/postagens/img-${DateTime.now().toString()}-$userId.png";

      final saveImage = await _storage.ref(ref).putFile(
            imageFile,
            SettableMetadata(contentType: "image/png"),
          );
      final imageUrl = await saveImage.ref.getDownloadURL();

      final response = await http.get(Uri.parse('https://tinyurl.com/api-create.php?url=$imageUrl'));

      if (response.statusCode != 200) {
        throw Exception('Falha ao encurtar URL: ${response.reasonPhrase}');
      }

      final shortUrlImage = response.body;

      final secondsSinceEpoch = _now.millisecondsSinceEpoch ~/ 1000;

      final user = await _firebase
          .collection("users")
          .where("id_user", isEqualTo: userId)
          .get();

      final nameUser = user.docs
          .map((e) {
            final data = e.data();

            return data['name_user'];
          })
          .toString()
          .replaceAll(regExp, '');

      final photoUser = user.docs
          .map((e) {
            final data = e.data();

            return data['image_user'];
          })
          .toString()
          .replaceAll(regExp, '');

      final whatsapp = user.docs
          .map((e) {
            final data = e.data();

            return data['whatsapp_user'];
          })
          .toString()
          .replaceAll(regExp, '');

      if (userId != null) {
        await _firebase.collection("posts").doc(_postId).set({
          'id': _postId,
          'age_pet': post.agePet,
          'gender_pet': post.genderPet,
          'url_image': shortUrlImage,
          'created_at': secondsSinceEpoch,
          'updated_at': secondsSinceEpoch,
          'user_id': userId,
          'name_user': nameUser,
          'photo_user': photoUser,
          'whatsapp': whatsapp,
        });
      } else {
        throw CommonNoDataFoundError();
      }
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
