import 'package:connect_pets/app/features/home/domain/usecase/user_details_usecase.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required this.userDetailsUseCase,
  }) : super(HomeInitial());

  final UserDetailsUseCase userDetailsUseCase;

  Future<void> userDetails(String id) async {
    emit(HomeLoading());

    final result = await userDetailsUseCase(id);

    result.fold(
      (error) => emit(HomeError(error)),
      (success) => emit(HomeSuccess(success)),
    );
  }
}
