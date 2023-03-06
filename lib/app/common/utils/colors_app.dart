import 'package:flutter/material.dart';

class ColorsApp {
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF004FB5);
  static const Color red = Color(0xFFCE2915);
  static const Color green = Color(0xFF03CE60);
  static const Color greenPrimary = Color(0xFF188A24);
  static const Color greenSecondary = Color(0xFF51DB24);
  static const Color lightGreen = Color(0xFF67D93F);
  static const Color darkGreen = Color(0xFF24611F);
  static const Color lightGray = Color(0xFFE8EAED);

  static const linearGradientGreen = LinearGradient(
    colors: [
      darkGreen,
      green,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
