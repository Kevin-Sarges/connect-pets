// ignore_for_file: void_checks

import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/features/signup/data/repository/signup_repository.dart';
import 'package:connect_pets/app/features/signup/domain/datasource/isignup_datasourcer.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../../test_values.dart';
import 'signup_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<SignupDatasourceImpl>()])
void main() {
  late MockSignupDatasourceImpl datasource;
  late SignupRepository repository;
  const user = UserModel();

  setUp(() {
    datasource = MockSignupDatasourceImpl();
    repository = SignupRepository(datasourceImpl: datasource);
  });

  test(
      "Deve retorna vazio(Void) se o usuário consegui se cadastrar com email e senha",
      () async {
    final responseDataSource = tVoid;
    final responseRepository = Right<Failure, void>(responseDataSource);

    when(datasource.signupUserEmailPassword(user)).thenAnswer(
      (_) async => responseDataSource,
    );

    final result = await repository.signupUserEmailPassword(user);

    expect(result, responseRepository);
  });

  test(
      "Deve retorna falha(Failure) se o usuario não consegui se cadastrar com email e senha",
      () async {
    final responseDataSource = ErrorMock();
    final responseRepository = Left<Failure, void>(responseDataSource);

    when(datasource.signupUserEmailPassword(user))
        .thenThrow(responseDataSource);

    final result = await repository.signupUserEmailPassword(user);

    expect(result, responseRepository);
  });
}
