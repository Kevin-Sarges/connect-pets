import 'package:firebase_auth/firebase_auth.dart';

abstract interface class SplashDataSourceImpl {
  Future<User?> isLoggerIn();
}
