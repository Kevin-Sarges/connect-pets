import 'package:connect_pets/app/features/login/domain/usecase/login_facebook_usecase.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_google_usecase.dart';
import 'package:connect_pets/app/features/login/presenter/controller/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginFacebookUseCase,
    required this.loginGoogleUseCase,
  }) : super(LoginInit());

  final LoginFacebookUseCase loginFacebookUseCase;
  final LoginGoogleUseCase loginGoogleUseCase;

  Future<void> google() async {
    emit(LoginCarregando());

    final result = await loginGoogleUseCase();

    result.fold(
      (erro) => emit(LoginErro(erro)),
      (_) => emit(LoginSucesso()),
    );
  }

  Future<void> facebook() async {
    emit(LoginCarregando());

    final result = await loginFacebookUseCase();

    result.fold(
      (erro) => emit(LoginErro(erro)),
      (_) => emit(LoginSucesso()),
    );
  }
}
