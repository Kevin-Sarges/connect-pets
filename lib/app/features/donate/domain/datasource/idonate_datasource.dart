import 'package:connect_pets/app/common/model/post_model.dart';

abstract interface class DonateDatasourceImpl {
  Future<void> donatePetPost(PostModel post);
}