import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_user_case.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  final SignupUseCase signupUseCase;

  Future<void> signupUser(UserModel userModel) async {
    emit(SignupLoading());

    final result = await signupUseCase(userModel);

    result.fold(
      (error) => emit(SignupError(error)),
      (_) => emit(
        SignupSuccess(),
      ),
    );
  }
}
