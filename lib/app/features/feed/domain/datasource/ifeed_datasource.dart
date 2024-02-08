import 'package:connect_pets/app/common/entity/post_entity.dart';

abstract interface class FeedDataSourceImpl {
  Future<List<PostEntity>> listPosts();
  Future<void> logout();
}