import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/features/refactor_password/domain/usecase/refactor_password_usecase.dart';
import 'package:connect_pets/app/features/refactor_password/presenter/cubit/refactor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RefactorPasswordCubit extends Cubit<RefactorPasswordState> {
  RefactorPasswordCubit({required this.refactorPasswordUseCase})
      : super(RefactorPasswordInitial());

  final RefactorPasswordUseCase refactorPasswordUseCase;

  Future<void> refactorPassword(UserEntity user) async {
    emit(RefactorPasswordLoading());

    final result = await refactorPasswordUseCase(user);

    result.fold(
      (error) => emit(RefactorPasswordError(error)),
      (_) => emit(RefactorPasswordSuccess()),
    );
  }
}
