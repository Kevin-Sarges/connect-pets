import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/features/doar/presenter/doar_screen.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/finish_signup_screen.dart';
import 'package:connect_pets/app/features/home/presenter/home_screen.dart';
import 'package:connect_pets/app/features/init/init.dart';
import 'package:connect_pets/app/features/login/presenter/login_screen.dart';
import 'package:connect_pets/app/features/perfil/presenter/perfil_screen.dart';
import 'package:connect_pets/app/features/signup/presenter/signup_screen.dart';
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
        RoutesApp.root: (context) => const SplashScreen(),
        RoutesApp.initialPage: (context) => const InitScreen(),
        RoutesApp.signup: (context) => const SignupScreen(),
        RoutesApp.finishSignup: (context) => const FinishSignupScreen(),
        RoutesApp.login: (context) => const LoginScreen(),
        RoutesApp.home: (context) => const HomeScreen(),
        RoutesApp.profile: (context) => const PerfilScreen(),
        RoutesApp.donate: (context) => const DoarScreen(),
      },
    );
  }
}
