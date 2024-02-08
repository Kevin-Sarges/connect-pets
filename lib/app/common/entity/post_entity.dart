import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? urlImage;
  final String? agePet;
  final String? genderPet;
  final int? createdAt;
  final int? updatedAt;
  final String? userId;
  final String? nameUser;
  final String? photoUser;
  final int? whatsapp;

  const PostEntity({
    this.id,
    this.agePet,
    this.genderPet,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.urlImage,
    this.nameUser,
    this.whatsapp,
    this.photoUser,
  });


  @override
  List<Object?> get props => [
    id,
    agePet,
    genderPet,
    createdAt,
    updatedAt,
    userId,
    urlImage,
    nameUser,
    whatsapp,
    photoUser,
  ];
}