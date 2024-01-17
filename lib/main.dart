import 'package:connect_pets/app/common/inject/inject_dependency.dart';
import 'package:connect_pets/app/main_app.dart';
import 'package:flutter/material.dart';


void main() async {
  InjectDependency.init();
  runApp(const MyApp());
}
