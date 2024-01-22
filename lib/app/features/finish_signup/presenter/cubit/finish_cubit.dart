import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/features/finish_signup/domain/usecase/finish_signup_usecase.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinishCubit extends Cubit<FinishSignupState> {
  FinishCubit({
    required this.finishSignupUseCase,
  }) : super(FinishSignupInitial());

  final FinishSignupUseCase finishSignupUseCase;

  Future<void> finishSignupUser(UserEntity user) async {
    emit(FinishSignupLoading());

    final result = await finishSignupUseCase(user);

    result.fold(
      (error) => emit(FinishSignupError(error)),
      (_) => emit(FinishSignupSuccess()),
    );
  }
}
