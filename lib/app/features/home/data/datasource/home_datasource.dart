import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeDatasource implements HomeDatasourceImpl {
  final _fireAuth = FirebaseAuth.instance;

  @override
  Future<User?> userDetails() async {
    try{
      final user = _fireAuth.currentUser;

      return user;
    } on FirebaseAuthException catch(e) {
      throw CommonNoDataFoundError(message: e.message);
    }
  }

}
