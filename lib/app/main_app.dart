import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/features/login/presenter/login_screen.dart';
import 'package:connect_pets/app/features/splash/presenter/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Connect pet',
      debugShowCheckedModeBanner: false,
      routes: {
        RoutesApp.initialRouter: (context) => const SplashScreen(),
        RoutesApp.login: (context) => const LoginScreen(),
        RoutesApp.home: (context) => Container(),
        RoutesApp.perfil: (context) => Container(),
        RoutesApp.post: (context) => Container(),
      },
    );
  }
}
