import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart';
import 'package:connect_pets/app/features/signup/domain/usecase/signup_google_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_values.dart';
import 'signup_email_password_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignupRepositoryImpl>()])
void main() {
  late MockSignupRepositoryImpl repository;
  late SignupGoogleUseCase useCase;
  late UserCredential userCredential;

  setUp(() {
    repository = MockSignupRepositoryImpl();
    useCase = SignupGoogleUseCase(repositoryImpl: repository);
    userCredential = MockUserCredential();
  });

  test(
      "Deve retorna um UserCredential se a primeira etapa do cadastro com o google deu certo",
      () async {
    // cenario
    final setting = Right<Failure, UserCredential>(userCredential);

    when(repository.signupGoogle()).thenAnswer(
      (_) async => setting,
    );

    // ação
    final result = await useCase();

    // esperado
    expect(result, setting);
  });

  test(
      "Deve retorna um falha(Failure) se a primeira etapa do cadastro com google deu errado",
      () async {
    final setting = Left<Failure, UserCredential>(ErrorMock());

    when(repository.signupGoogle()).thenAnswer(
      (_) async => setting,
    );

    final result = await useCase();

    expect(result, setting);
  });
}
