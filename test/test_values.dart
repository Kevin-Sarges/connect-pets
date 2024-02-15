// ignore_for_file: subtype_of_sealed_class, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/error/failure.dart';
import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mockito/mockito.dart';

UserEntity Function() tUserEntity = () => const UserEntity(
      cityUser: "Ponta de Pedras",
      emailUser: "kevin@gmail.com",
      idUser: "flaheif4f4ifa5ds4fa6sdfa6sd4fa",
      nameUser: "Kevin Sarges",
      passwordUser: "412341351363547354",
      whatsappUser: "91985206041",
    );

UserModel Function() tUserModel = () => const UserModel(
      cityUser: "Ponta de Pedras",
      emailUser: "kevin@gmail.com",
      idUser: "flaheif4f4ifa5ds4fa6sdfa6sd4fa",
      nameUser: "Kevin Sarges",
      passwordUser: "412341351363547354",
      whatsappUser: "91985206041",
    );

class MockUserCredential extends Mock implements UserCredential {}

class MockCollectionReference extends Mock implements CollectionReference {}

class ErrorMock extends Equatable implements Failure {
  @override
  String get errorMessage => "Erro";

  @override
  List<Object?> get props => [];
}
