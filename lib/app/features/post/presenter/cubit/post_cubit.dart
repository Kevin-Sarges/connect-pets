import 'package:connect_pets/app/features/post/domain/usecase/deleted_post_usecase.dart';
import 'package:connect_pets/app/features/post/domain/usecase/edit_post_usecase.dart';
import 'package:connect_pets/app/features/post/presenter/cubit/post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit({
    required this.deletedPostUseCase,
    required this.editPostUseCase,
  }) : super(PostInitial());

  final EditPostUseCase editPostUseCase;
  final DeletedPostUseCase deletedPostUseCase;

  Future<void> edit(String? age, String? gender, String id) async {
    emit(PostLoading());

    final result = await editPostUseCase(age, gender, id);

    result.fold(
      (error) => emit(PostError(error)),
      (_) => emit(PostUpdatedSuccess()),
    );
  }

  Future delete(String id) async {
    emit(PostLoading());

    final result = await deletedPostUseCase(id);

    result.fold(
      (error) => emit(PostError(error)),
      (_) => emit(PostDeletedSuccess()),
    );
  }
}
