// Mocks generated by Mockito 5.4.4 from annotations
// in connect_pets/test/app/features/signup/domain/usecase/signup_email_password_usecase_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:connect_pets/app/common/error/failure.dart' as _i5;
import 'package:connect_pets/app/common/model/user_model.dart' as _i7;
import 'package:connect_pets/app/features/signup/domain/repository/isignup_repository.dart'
    as _i3;
import 'package:dartz/dartz.dart' as _i2;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [SignupRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignupRepositoryImpl extends _i1.Mock
    implements _i3.SignupRepositoryImpl {
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>
      signupUserEmailPassword(_i7.UserModel? userModel) => (super.noSuchMethod(
            Invocation.method(
              #signupUserEmailPassword,
              [userModel],
            ),
            returnValue:
                _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>.value(
                    _FakeEither_0<_i5.Failure, _i6.UserCredential>(
              this,
              Invocation.method(
                #signupUserEmailPassword,
                [userModel],
              ),
            )),
            returnValueForMissingStub:
                _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>.value(
                    _FakeEither_0<_i5.Failure, _i6.UserCredential>(
              this,
              Invocation.method(
                #signupUserEmailPassword,
                [userModel],
              ),
            )),
          ) as _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>);

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>> signupGoogle() =>
      (super.noSuchMethod(
        Invocation.method(
          #signupGoogle,
          [],
        ),
        returnValue:
            _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>.value(
                _FakeEither_0<_i5.Failure, _i6.UserCredential>(
          this,
          Invocation.method(
            #signupGoogle,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>.value(
                _FakeEither_0<_i5.Failure, _i6.UserCredential>(
          this,
          Invocation.method(
            #signupGoogle,
            [],
          ),
        )),
      ) as _i4.Future<_i2.Either<_i5.Failure, _i6.UserCredential>>);
}