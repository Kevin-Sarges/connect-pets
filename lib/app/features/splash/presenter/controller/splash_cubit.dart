import 'package:connect_pets/app/features/splash/domain/usecase/user_is_logger_usecase.dart';
import 'package:connect_pets/app/features/splash/presenter/controller/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.userIsLoggerUsecase}) : super(SplashIntial());

  final UserIsLoggerUsecase userIsLoggerUsecase;

  Future<void> checkLogin() async {
    emit(SplashCarregando());

    final result = await userIsLoggerUsecase();

    emit(result.fold(
      (_) => SplashNaoLogado(),
      (_) => SplashLogado(),
    ));
  }
}
