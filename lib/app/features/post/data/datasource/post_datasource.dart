import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/post/domain/datasource/ipost_datasource.dart';

class PostDataSource implements PostDataSourceImpl {
  final _firebase = FirebaseFirestore.instance;

  @override
  Future<void> deletedPost(String id) async {
    try {
      await _firebase.collection("posts").doc(id).delete();
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

  @override
  Future<void> editPost(
    String? age,
    String? gender,
    String id,
  ) async {
    try {
      await _firebase.collection("posts").doc(id).update({
        'gender_pet': gender,
        'age_pet': age,
      });
    } on FirebaseException catch (e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }
}
