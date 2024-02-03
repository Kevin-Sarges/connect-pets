import 'package:connect_pets/app/common/entity/post_entity.dart';

class PostModel extends PostEntity {
  const PostModel({
    super.agePet,
    super.createdAt,
    super.id,
    super.updatedAt,
    super.urlImage,
    super.userId,
});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      agePet: json['age_pet'] as String,
      urlImage: json['url_image'] as String,
      createdAt: json['created_at'] as DateTime,
      updatedAt: json['updated_at'] as DateTime,
      userId: json['user_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'age_pet': agePet,
      'url_image': urlImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
    };
  }

  List<PostEntity> fromJsonList(List list) {
    return list.map((e) => PostModel.fromJson(e)).toList();
  }
}