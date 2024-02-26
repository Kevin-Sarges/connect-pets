abstract interface class PostDataSourceImpl {
  Future<void> editPost(String? age, String? gender, String id);
  Future<void> deletedPost(String id);
}
