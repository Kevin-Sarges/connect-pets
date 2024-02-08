import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/widgets/empty_post_list_widget.dart';
import 'package:connect_pets/app/features/feed/presenter/cubit/feed_cubit.dart';
import 'package:connect_pets/app/features/feed/presenter/cubit/feed_state.dart';
import 'package:connect_pets/app/features/feed/presenter/widgets/info_pet_widget.dart';
import 'package:connect_pets/app/features/feed/presenter/widgets/loaging_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';
import 'package:url_launcher/url_launcher.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final _cubit = GetIt.I.get<FeedCubit>();

  @override
  void initState() {
    super.initState();

    _cubit.getPosts();
  }

  String _covertDatetime(int? timeMilliseconds) {
    DateTime postDateTime =
        DateTime.fromMillisecondsSinceEpoch(timeMilliseconds! * 1000);
    DateTime now = DateTime.now();
    Duration difference = now.difference(postDateTime);

    switch (difference.inSeconds) {
      case < 60:
        return 'agora';
      default:
        switch (difference.inMinutes) {
          case < 60:
            return '${difference.inMinutes} min atrás';
          default:
            switch (difference.inHours) {
              case < 24:
                return '${difference.inHours}h atrás';
              default:
                int days = difference.inDays;
                switch (days) {
                  case 1:
                    return '1 dia atrás';
                  default:
                    return '$days dias atrás';
                }
            }
        }
    }
  }

  void _logoutUser() {
    _cubit.logOutUser();

    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesApp.login,
      (_) => true,
    );
  }

  void _launchWhatsAppUri(String whatsapp) async {
    final link = WhatsAppUnilink(
      phoneNumber: '+55 - $whatsapp',
      text: 'Olá, tenho interesse em adotar o pet🤗'
    );

    await launchUrl(link.asUri());
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Connect Pets",
          style: TextStyle(
            color: ColorsApp.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: "Tienne",
          ),
        ),
        actions: [
          IconButton(
            onPressed: _logoutUser,
            icon: const Icon(
              Icons.logout,
              color: ColorsApp.green100,
            ),
          ),
        ],
      ),
      backgroundColor: ColorsApp.grey50,
      body: BlocBuilder<FeedCubit, FeedState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is FeedLoading) {
            return const LoagingPostWidget();
          }

          if (state is FeedError) {
            return Center(
              child: Text(state.error.errorMessage),
            );
          }

          if (state is FeedSuccess) {
            final post = state.post;

            if (post.isEmpty) {
              return const EmptyPostListWidget();
            } else {
              return RefreshIndicator(
                onRefresh: () => _cubit.getPosts(),
                color: ColorsApp.green100,
                child: ListView.separated(
                  itemCount: post.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 7),
                  itemBuilder: (context, index) {
                    return Container(
                      width: width,
                      height: 560,
                      color: ColorsApp.white,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 8,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(999),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(999),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl: post[index].photoUser!,
                                          placeholder: (context, url) =>
                                              Shimmer.fromColors(
                                            baseColor: ColorsApp.grey150,
                                            highlightColor: ColorsApp.white,
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: ColorsApp.grey100,
                                                borderRadius:
                                                    BorderRadius.circular(999),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Center(
                                            child: Icon(
                                              Icons.error,
                                              color: ColorsApp.red,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 7),
                                    Text(
                                      post[index].nameUser!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  _covertDatetime(post[index].createdAt),
                                  style: const TextStyle(
                                    color: ColorsApp.grey100,
                                    fontSize: 12,
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 9),
                          CachedNetworkImage(
                            width: width,
                            height: 400,
                            imageUrl: post[index].urlImage!,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: ColorsApp.grey150,
                              highlightColor: ColorsApp.white,
                              child: Container(
                                width: width,
                                height: 400,
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
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.fromLTRB(
                              8,
                              0,
                              8,
                              10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 150,
                                  height: 50,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InfoPetWidget(
                                        title: 'Idade do pet: ',
                                        info: post[index].agePet!,
                                      ),
                                      InfoPetWidget(
                                        title: 'Gênero do pet: ',
                                        info: post[index].genderPet!,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 7),
                                ElevatedButton(
                                  onPressed: () {
                                    _launchWhatsAppUri(post[index].whatsapp.toString());
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsApp.green100,
                                  ),
                                  child: const Text(
                                    "Entrar em contato",
                                    style: TextStyle(
                                      color: ColorsApp.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          }

          return Container();
        },
      ),
    );
  }
}
