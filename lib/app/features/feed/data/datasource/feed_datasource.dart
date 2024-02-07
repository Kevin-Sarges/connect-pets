import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/features/feed/domain/datasource/ifeed_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FeedDatasource implements FeedDataSourceImpl {
  final _firebaseFirestore = FirebaseFirestore.instance;
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<List<PostEntity>> listPosts() async {
    try {
      final getPosts = await _firebaseFirestore
          .collection("posts")
          .orderBy("created_at", descending: true)
          .get();

      final result = getPosts.docs.map((e) {
        final data = e.data();

        return PostModel.fromJson(data);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
