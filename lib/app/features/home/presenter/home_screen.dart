import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/features/doar/presenter/doar_screen.dart';
import 'package:connect_pets/app/features/feed/presenter/feed_screen.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_cubit.dart';
import 'package:connect_pets/app/features/home/presenter/cubit/home_state.dart';
import 'package:connect_pets/app/features/perfil/presenter/perfil_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PersistentTabController();
  final _cubit = GetIt.I.get<HomeCubit>();
  final _uid = FirebaseAuth.instance.currentUser?.uid;

  @override
  void initState() {
    super.initState();

    _cubit.userDetails(_uid!);
  }

  List<Widget> _buildScreens() {
    return const [
      FeedScreen(),
      DoarScreen(),
      PerfilScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems({required String nameUser}) {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Feed"),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.add,
          color: ColorsApp.white,
        ),
        title: ("Doar"),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: (nameUser),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
          bloc: _cubit,
          builder: (context, state) {
            if (state is HomeSuccess) {
              return PersistentTabView(
                context,
                controller: _controller,
                screens: _buildScreens(),
                items: _navBarsItems(
                  nameUser: state.user.nameUser.toString(),
                ),
                backgroundColor: ColorsApp.green50,
                decoration: const NavBarDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                screenTransitionAnimation: const ScreenTransitionAnimation(
                  animateTabTransition: true,
                  curve: Curves.linear,
                  duration: Duration(milliseconds: 200),
                ),
                navBarStyle: NavBarStyle.style15,
              );
            }

            return Container();
          },
        ),
      ),
    );
  }
}
