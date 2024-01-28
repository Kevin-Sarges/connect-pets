import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/error/common_errors.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/data/datasource/signup_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_values.dart';
import 'signup_datasource_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<GoogleSignIn>(),
  MockSpec<FirebaseFirestore>(),
])
void main() {
  late MockFirebaseAuth firebaseAuth;
  late MockFirebaseFirestore firebaseFirestore;
  late MockGoogleSignIn googleSignIn;
  late SignupDatasource datasource;

  setUp(() async {
    firebaseAuth = MockFirebaseAuth();
    firebaseFirestore = MockFirebaseFirestore();
    googleSignIn = MockGoogleSignIn();

    datasource = SignupDatasource(
      fireAuth: firebaseAuth,
      fireStore: firebaseFirestore,
      googleAuth: googleSignIn,
    );

    when(firebaseFirestore.collection(any)).thenReturn(
        MockCollectionReference() as CollectionReference<Map<String, dynamic>>);
  });

  test('signupUserEmailPassword should return UserCredential', () async {
    // Arrange
    const userModel = UserModel(
      emailUser: 'test@example.com',
      passwordUser: 'password123',
      cityUser: 'Test City',
      nameUser: 'Test User',
      whatsappUser: 123456789,
    );

    // Act
    final result = await datasource.signupUserEmailPassword(userModel);

    // Assert
    expect(result, isA<UserCredential>());
  });

  test(
      "Deve lançar CommonNoDataFoundError se o email ou senha estiverem vazios",
      () async {
    const userModel = UserModel(emailUser: "", passwordUser: "");

    expect(
      () async {
        await datasource.signupUserEmailPassword(userModel);
      },
      throwsA(isA<CommonNoDataFoundError>()),
    );
  });

  test("Deve lançar CommonNoDataFoundError se o email já estiver cadastrado",
      () async {
    when(
      firebaseAuth.createUserWithEmailAndPassword(
        email: "test@gmail.com",
        password: "123456789",
      ),
    ).thenThrow(FirebaseAuthException(code: "email-already-in-use"));

    const userModel = UserModel(
      emailUser: "test@gmail.com",
      passwordUser: "123456789",
    );

    expect(
      () async {
        await datasource.signupUserEmailPassword(userModel);
      },
      throwsA(isA<CommonNoDataFoundError>()),
    );
  });
}
