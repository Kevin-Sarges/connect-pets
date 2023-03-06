import 'package:firebase_auth/firebase_auth.dart';

abstract class SplashDataSourceImpl {
  Future<User?> isLoggerIn();
}
