import 'package:flutter/material.dart';

class ColorsApp {
  static const Color white = Color(0xFFFFFFFF);
  static const Color blue = Color(0xFF004FB5);
  static const Color red = Color(0xFFCE2915);
  static const Color black = Color(0xFF000000);
  static const Color green200 = Color(0xFF236320);
  static const Color green150 = Color(0xFF02A64D);
  static const Color green100 = Color(0xFF04CB5E);
  static const Color green50 = Color(0xFFC8F2DB);
  static const Color grey150 = Color(0xFFBBBCBC);
  static const Color grey100 = Color(0xFFD9D9D9);
  static const Color grey50 = Color(0xFFE8EAED);

  static const linearGradientGreen = LinearGradient(
    colors: [
      green150,
      green100,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
