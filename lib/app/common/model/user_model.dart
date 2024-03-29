import 'package:connect_pets/app/common/entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    super.idUser,
    super.imageUser,
    super.cityUser,
    super.emailUser,
    super.nameUser,
    super.passwordUser,
    super.whatsappUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'] as String,
      imageUser: json['image_user'] as String,
      cityUser: json['city_user'] as String,
      emailUser: json['email_user'] as String,
      nameUser: json['name_user'] as String,
      passwordUser: json['password_user'] as String?,
      whatsappUser: json['whatsapp_user'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'image_user': imageUser,
      'city_user': cityUser,
      'email_user': emailUser,
      'name_user': nameUser,
      'password_user': passwordUser,
      'whatsapp_user': whatsappUser,
    };
  }

  List<UserEntity> fromJsonList(List list) {
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
