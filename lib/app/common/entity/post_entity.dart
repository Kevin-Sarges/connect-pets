import 'package:equatable/equatable.dart';

class PostEntity extends Equatable {
  final String? id;
  final String? urlImage;
  final String? agePet;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? userId;

  const PostEntity({
    this.id,
    this.agePet,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.urlImage,
  });


  @override
  List<Object?> get props => [
    id,
    agePet,
    createdAt,
    updatedAt,
    userId,
    urlImage,
  ];
}