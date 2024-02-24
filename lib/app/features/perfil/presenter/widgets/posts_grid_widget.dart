import "package:cached_network_image/cached_network_image.dart";
import "package:connect_pets/app/common/utils/colors_app.dart";
import "package:connect_pets/app/common/widgets/empty_post_list_widget.dart";
import "package:connect_pets/app/common/widgets/error_screen_widget.dart";
import "package:connect_pets/app/features/perfil/presenter/cubit/perfil_cubit.dart";
import "package:connect_pets/app/features/perfil/presenter/cubit/perfil_state.dart";
import "package:connect_pets/app/features/perfil/presenter/widgets/skeleton_posts_loading_widget.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";
import "package:shimmer/shimmer.dart";

class PostsGridWidget extends StatefulWidget {
  const PostsGridWidget({super.key});

  @override
  State<PostsGridWidget> createState() => _PostsGridWidgetState();
}

class _PostsGridWidgetState extends State<PostsGridWidget> {
  final _cubit = GetIt.I.get<PerfilCubit>();
  final _uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    _cubit.postUser(_uid!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PerfilCubit, PerfilState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state is PerfilLoading) {
          return SkeletonPostsLoadingWidget();
        }

        if (state is PerfilError) {
          return const ErrorScreenWidget(
            messageError: "Erro ao tentar\nlista suas postagens 😬",
          );
        }

        if (state is ListPost) {
          final post = state.post;

          if (post.isEmpty) {
            return const EmptyPostListWidget();
          }

          return GridView.builder(
            itemCount: post.length,
            padding: const EdgeInsets.all(6),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, index) => CachedNetworkImage(
              imageUrl: post[index].urlImage!,
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: ColorsApp.grey100,
                highlightColor: ColorsApp.grey50,
                child: Container(
                  color: ColorsApp.grey100,
                ),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(
                  Icons.error,
                  color: ColorsApp.red,
                ),
              ),
            ),
          );
        }

        return Container();
      },
    );
  }
}
