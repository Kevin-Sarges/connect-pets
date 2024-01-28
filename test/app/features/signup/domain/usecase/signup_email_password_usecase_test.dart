// ignore_for_file: void_checks
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_email_password_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_values.dart';
import 'signup_email_password_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignupRepositoryImpl>()])
void main() {
  late SignupEmailPasswordUseCase useCase;
  late MockSignupRepositoryImpl repository;
  late UserCredential userCredential;
  const user = UserModel();

  setUp(() {
    repository = MockSignupRepositoryImpl();
    userCredential = MockUserCredential();
    useCase = SignupEmailPasswordUseCase(repositoryImpl: repository);
  });

  test(
      "Deve retonar o userCredential se o cadastro com email e senha deu certo",
      () async {
    // Cenario
    final response = userCredential;
    when(repository.signupUserEmailPassword(user))
        .thenAnswer((_) async => Right<Failure, UserCredential>(response));

    // Ação
    final result = await useCase(user);

    // Esperado
    expect(result, Right<Failure, UserCredential>(response));
  });

  test("Deve retonar falha(Failure) se o cadastro com email e senha deu errado",
      () async {
    // Cenario
    final error = ErrorMock();
    when(repository.signupUserEmailPassword(user))
        .thenAnswer((_) async => Left<Failure, UserCredential>(error));

    // Ação
    final result = await useCase(user);

    // Esperado
    expect(result, Left<Failure, UserCredential>(error));
  });
}
