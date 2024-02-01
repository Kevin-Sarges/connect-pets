import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? idUser;
  final String? imageUser;
  final String? nameUser;
  final String? emailUser;
  final String? cityUser;
  final int? whatsappUser;
  final String? passwordUser;

  const UserEntity({
    this.idUser,
    this.imageUser,
    this.cityUser,
    this.emailUser,
    this.nameUser,
    this.passwordUser,
    this.whatsappUser,
  });

  @override
  List<Object?> get props => [
        idUser,
        imageUser,
        nameUser,
        emailUser,
        cityUser,
        whatsappUser,
        passwordUser,
      ];
}
