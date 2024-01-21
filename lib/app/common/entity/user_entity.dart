class UserEntity {
  final String? idUser;
  final String nameUser;
  final String emailUser;
  final String cityUser;
  final int whatsappUser;
  final String passwordUser;

  UserEntity({
    this.idUser,
    required this.cityUser,
    required this.emailUser,
    required this.nameUser,
    required this.passwordUser,
    required this.whatsappUser,
  });
}
