import 'package:connect_pets/app/common/error/failure.dart';

sealed class LoginState {}

final class LoginInit extends LoginState {}

final class LoginCarregando extends LoginState {}

final class LoginSucesso extends LoginState {}

final class LoginErro extends LoginState {
  final Failure erro;

  LoginErro(this.erro);
}
