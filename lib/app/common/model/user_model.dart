import 'package:connect_pets/app/common/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.idUser,
    required super.cityUser,
    super.emailUser,
    required super.nameUser,
    required super.passwordUser,
    required super.whatsappUser,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      idUser: json['id_user'] as String,
      cityUser: json['city_user'] as String,
      emailUser: json['email_user'] as String,
      nameUser: json['name_user'] as String,
      passwordUser: json['password_user'] as String,
      whatsappUser: json['whatsapp_user'] as int,
    );
  }

  static Map<String, dynamic> toJson(UserEntity? userEntity) {
    return {
      'id_user': userEntity?.idUser,
      'city_user': userEntity?.cityUser,
      'email_user': userEntity?.emailUser,
      'name_user': userEntity?.nameUser,
      'password_user': userEntity?.passwordUser,
      'whatsapp_user': userEntity?.whatsappUser,
    };
  }

  List<UserEntity> fromJsonList(List list) {
    return list.map((e) => UserModel.fromJson(e)).toList();
  }
}
