import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/features/doar/presenter/doar_screen.dart';
import 'package:connect_pets/app/features/feed/presenter/feed_screen.dart';
import 'package:connect_pets/app/features/perfil/presenter/perfil_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = PersistentTabController();

  List<Widget> _buildScreens() {
    return const [
      FeedScreen(),
      DoarScreen(),
      PerfilScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: ("Feed"),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
      PersistentBottomNavBarItem(
        icon:const Icon(
          Icons.add,
          color: ColorsApp.white,
        ),
        title: ("Doar"),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: ("Perfil"),
        activeColorPrimary: ColorsApp.green100,
        inactiveColorPrimary: ColorsApp.black,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        backgroundColor: ColorsApp.green50,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.linear,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style15,
      ),
    );
  }
}
