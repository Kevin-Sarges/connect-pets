import 'package:connect_pets/app/common/error/failure.dart';

sealed class SplashState {}

final class SplashIntial extends SplashState {}

final class SplashCarregando extends SplashState {}

final class SplashLogado extends SplashState {}

final class SplashNaoLogado extends SplashState {}

final class SplashErro extends SplashState {
  final Failure erro;

  SplashErro(this.erro);
}
