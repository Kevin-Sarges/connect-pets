import 'package:firebase_auth/firebase_auth.dart';

abstract interface class HomeDatasourceImpl {
  Future<User?> userDetails();
}