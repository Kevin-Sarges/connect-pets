import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_user_case.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit({required this.signupUseCase}) : super(SignupInitial());

  final SignupUseCase signupUseCase;

  Future<void> signupUser(UserEntity user) async {
    emit(SignupLoading());

    final result = await signupUseCase(user);

    result.fold(
      (error) => emit(SignupError(error)),
      (_) => emit(
        SignupSuccess(),
      ),
    );
  }
}
