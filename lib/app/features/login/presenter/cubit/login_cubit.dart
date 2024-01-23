import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_email_password_usecase.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_facebook_usecase.dart';
import 'package:connect_pets/app/features/login/domain/usecase/login_google_usecase.dart';
import 'package:connect_pets/app/features/login/presenter/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({
    required this.loginEmailPasswordUseCase,
    required this.loginFacebookUseCase,
    required this.loginGoogleUseCase,
  }) : super(LoginInitial());

  final LoginEmailPasswordUseCase loginEmailPasswordUseCase;
  final LoginFacebookUseCase loginFacebookUseCase;
  final LoginGoogleUseCase loginGoogleUseCase;

  Future<void> emailPassword(UserEntity user) async {
    emit(LoginLoading());

    final result = await loginEmailPasswordUseCase(user);

    result.fold(
      (error) => emit(LoginError(error)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> google() async {
    emit(LoginLoading());

    final result = await loginGoogleUseCase();

    result.fold(
      (error) => emit(LoginError(error)),
      (_) => emit(LoginSuccess()),
    );
  }

  Future<void> facebook() async {
    emit(LoginLoading());

    final result = await loginFacebookUseCase();

    result.fold(
      (error) => emit(LoginError(error)),
      (_) => emit(LoginSuccess()),
    );
  }
}
