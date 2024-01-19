import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_email_password_usecase.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_google_usecase.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({
    required this.signupEmailPasswordUseCase,
    required this.signupGoogleUseCase,
  }) : super(SignupInitial());

  final SignupEmailPasswordUseCase signupEmailPasswordUseCase;
  final SignupGoogleUseCase signupGoogleUseCase;

  Future<void> signupUserEmailPassword(UserModel userModel) async {
    emit(SignupLoading());

    final result = await signupEmailPasswordUseCase(userModel);

    result.fold(
      (error) => emit(SignupError(error)),
      (_) => emit(SignupSuccess()),
    );
  }

  Future<void> signupGoogle() async {
    emit(SignupLoading());

    final result = await signupGoogleUseCase();

    result.fold(
      (error) => emit(SignupError(error)),
      (_) => SignupSuccess(),
    );
  }
}
