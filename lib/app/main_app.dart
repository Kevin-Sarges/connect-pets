import 'package:connect_pets/app/features/splash/presenter/splash_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Connect pet',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
