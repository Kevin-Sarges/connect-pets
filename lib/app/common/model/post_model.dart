import 'package:connect_pets/app/common/entity/post_entity.dart';

class PostModel extends PostEntity {
  PostModel({
    super.agePet,
    super.createdAt,
    super.genderPet,
    super.id,
    super.updatedAt,
    super.urlImage,
    super.userId,
    super.nameUser,
    super.photoUser,
    super.whatsapp,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] as String,
      agePet: json['age_pet'] as String,
      genderPet: json['gender_pet'] as String,
      urlImage: json['url_image'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int,
      userId: json['user_id'] as String,
      nameUser: json['name_user'] as String,
      photoUser: json['photo_user'] as String,
      whatsapp: json['whatsapp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'age_pet': agePet,
      'gender_pet': genderPet,
      'url_image': urlImage,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'user_id': userId,
      'name_user': nameUser,
      'photo_user': photoUser,
      'whatsapp': whatsapp,
    };
  }

  static List<PostEntity> fromJsonList(List list) {
    return list.map((e) => PostModel.fromJson(e)).toList();
  }
}
