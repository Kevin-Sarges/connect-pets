import 'package:connect_pets/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:connect_pets/app/features/splash/presenter/controller/splash_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit({required this.dataSource}) : super(SplashIntial());

  final SplashDataSourceImpl dataSource;

  Future<void> checkLogin() async {
    emit(SplashCarregando());

    final result = await dataSource.isLoggerIn();

    try {
      if (result != null) {
        emit(SplashLogado());
      } else {
        emit(SplashNaoLogado());
      }
    } catch (e) {
      emit(SplashErro());
    }
  }
}
