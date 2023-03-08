import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/splash/domain/datasource/isplash_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashDataSource implements SplashDataSourceImpl {
  final firebase = FirebaseAuth.instance;

  @override
  Future<bool> isLoggerIn() async {
    try {
      final user = firebase.currentUser;

      if (user == null) {
        return false;
      } else {
        return true;
      }
    } on FirebaseException catch (e) {
      throw CommonNoInternetConnectionError(message: e);
    }
  }
}
