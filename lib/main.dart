import 'package:connect_pets/app/common/inject/inject_dependency.dart';
import 'package:connect_pets/app/main_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  InjectDependency.init();
  runApp(const MyApp());
}
