import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/widgets/error_screen_widget.dart';
import 'package:connect_pets/app/common/widgets/loading_widgets/loading_screen_widget.dart';
import 'package:connect_pets/app/features/donate/presenter/donate_screen.dart';
import 'package:connect_pets/app/features/feed/presenter/feed_screen.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_cubit.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_state.dart';
import 'package:connect_pets/app/features/perfil/presenter/perfil_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cubit = GetIt.I.get<HomeCubit>();
  final _uid = FirebaseAuth.instance.currentUser?.uid;

  int _selectedScreenIndex = 0;

  @override
  void initState() {
    super.initState();

    _cubit.userDetails(_uid!);
  }

  final _buildScreens = [
    const FeedScreen(),
    const DonateScreen(),
    const PerfilScreen(),
  ];

  void _onScreenTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeCubit, HomeState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              backgroundColor: ColorsApp.white,
              body: LoadingScreenWidget(),
            );
          }

          if (state is HomeError) {
            return Scaffold(
              backgroundColor: ColorsApp.white,
              body: ErrorScreenWidget(
                messageError: state.error.errorMessage,
              ),
            );
          }

          if (state is HomeSuccess) {
            final user = state.user;

            final name = user.nameUser;
            int limit = 10;
            String ellipsis = "...";

            String limitName = name!.length <= limit
                ? name
                : name.substring(0, limit) + ellipsis;

            return Scaffold(
              body: _buildScreens.elementAt(_selectedScreenIndex),
              bottomNavigationBar: ConvexAppBar(
                onTap: _onScreenTapped,
                backgroundColor: ColorsApp.green50,
                initialActiveIndex: 0,
                curveSize: 80,
                top: -20,
                color: ColorsApp.green100,
                style: TabStyle.reactCircle,
                activeColor: ColorsApp.green100,
                items: [
                  const TabItem(
                    icon: Icons.home_filled,
                    title: 'Feed',
                  ),
                  const TabItem(
                    icon: Icons.add_a_photo_rounded,
                    title: 'Postar',
                  ),
                  TabItem(
                    icon: Icons.person,
                    title: limitName,
                  ),
                ],
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
