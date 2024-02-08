import 'package:connect_pets/app/features/feed/domain/usecase/list_posts_usecase.dart';
import 'package:connect_pets/app/features/feed/domain/usecase/logout_usecase.dart';
import 'package:connect_pets/app/features/feed/presenter/cubit/feed_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedCubit extends Cubit<FeedState> {
  FeedCubit({
    required this.logoutUseCase,
    required this.listPostsUseCase,
  }) : super(FeedInitial());

  final ListPostsUseCase listPostsUseCase;
  final LogoutUseCase logoutUseCase;

  Future<void> logOutUser() async {
    emit(FeedLoading());

    final result = await logoutUseCase();

    result.fold(
      (error) => emit(FeedError(error)),
      (_) => emit(LogoutSuccess()),
    );
  }

  Future<void> getPosts() async {
    emit(FeedLoading());

    final result = await listPostsUseCase();

    result.fold(
      (error) => emit(FeedError(error)),
      (success) => emit(FeedSuccess(success)),
    );
  }
}
