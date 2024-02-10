import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/features/donate/domain/usecase/donate_pet_post_usecase.dart';
import 'package:connect_pets/app/features/donate/presenter/cubit/donate_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DonateCubit extends Cubit<DonateState> {
  DonateCubit({required this.donatePetPostUseCase}) : super(DonateInitial());

  final DonatePetPostUseCase donatePetPostUseCase;

  Future<void> donate(PostModel post) async {
    emit(DonateLoading());

    final result = await donatePetPostUseCase(post);

    result.fold(
      (error) => emit(DonateError(error)),
      (_) => emit(DonateSuccess()),
    );
  }
}
