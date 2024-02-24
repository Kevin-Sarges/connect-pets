import 'package:connect_pets/app/features/perfil/domain/usecase/get/get_perfil_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/get/get_posts_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_image_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_name_usecase.dart';
import 'package:connect_pets/app/features/perfil/domain/usecase/updated/update_whatsapp_usecase.dart';
import 'package:connect_pets/app/features/perfil/presenter/cubit/perfil_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PerfilCubit extends Cubit<PerfilState> {
  PerfilCubit({
    required this.getPostsUseCase,
    required this.getInfoPerfilUseCase,
    required this.updateWhatsappUseCase,
    required this.updateImageUseCase,
    required this.updateNameUseCase,
  }) : super(PerfilInitial());

  final GetInfoPerfilUseCase getInfoPerfilUseCase;
  final GetPostsUseCase getPostsUseCase;
  final UpdateNameUseCase updateNameUseCase;
  final UpdateImageUseCase updateImageUseCase;
  final UpdateWhatsappUseCase updateWhatsappUseCase;

  Future<void> infoPerfil(String idUser) async {
    emit(PerfilLoading());

    final result = await getInfoPerfilUseCase(idUser);

    result.fold(
      (error) => emit(PerfilError(error)),
      (success) => emit(InfoUser(success)),
    );
  }

  Future<void> postUser(String idUser) async {
    emit(PerfilLoading());

    final result = await getPostsUseCase(idUser);

    result.fold(
      (error) => emit(PerfilError(error)),
      (success) => emit(ListPost(success)),
    );
  }

  Future<void> newName(String idUser, String name) async {
    emit(PerfilLoading());

    final result = await updateNameUseCase(idUser, name);

    result.fold(
      (error) => emit(PerfilError(error)),
      (_) => emit(PerfilUpdatedSuccess()),
    );
  }

  Future<void> newWhatsapp(String idUser, String whatsapp) async {
    emit(PerfilLoading());

    final result = await updateWhatsappUseCase(idUser, whatsapp);

    result.fold(
      (error) => emit(PerfilError(error)),
      (_) => emit(PerfilUpdatedSuccess()),
    );
  }

  Future<void> newImage(String idUser, String? image) async {
    emit(PerfilLoading());

    final result = await updateImageUseCase(idUser, image!);

    result.fold(
      (error) => emit(PerfilError(error)),
      (_) => emit(PerfilUpdatedSuccess()),
    );
  }
}
