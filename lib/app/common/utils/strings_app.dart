class StringsApp {
  static const apple = 'Apple';
  static const facebook = 'Facebook';
  static const google = 'Google';

  static const nameApp = 'Connect pets';

  static facaLoginCom(String login) {
    if (login == apple) {
      return 'Faça login com a $apple';
    }
    return 'Faça login com $login';
  }
}
