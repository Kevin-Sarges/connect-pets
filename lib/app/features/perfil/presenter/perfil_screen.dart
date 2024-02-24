import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/features/perfil/presenter/cubit/perfil_cubit.dart';
import 'package:connect_pets/app/features/perfil/presenter/cubit/perfil_state.dart';
import 'package:connect_pets/app/features/perfil/presenter/widgets/input_perfil_widget.dart';
import 'package:connect_pets/app/features/perfil/presenter/widgets/posts_grid_widget.dart';
import 'package:connect_pets/app/features/perfil/presenter/widgets/skeleton_infouser_loading_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PerfilScreen extends StatefulWidget {
  const PerfilScreen({Key? key}) : super(key: key);

  @override
  State<PerfilScreen> createState() => _PerfilScreenState();
}

class _PerfilScreenState extends State<PerfilScreen> {
  final _cubit = GetIt.I.get<PerfilCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textNameController = TextEditingController();
  final _textWhatsappController = TextEditingController();

  final _uid = FirebaseAuth.instance.currentUser?.uid;
  final _formatWhatsappNumber = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  File? _selectedFile;

  @override
  void initState() {
    _cubit.infoPerfil(_uid!);
    super.initState();
  }

  Future<XFile?> _getImageGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);
      });

      return image;
    }

    return null;
  }

  Future<XFile?> _getImageCamera() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _selectedFile = File(image.path);
      });

      return image;
    }

    return null;
  }

  void _showModal(double width) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        width: width,
        height: 260,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: ColorsApp.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            IconButton(
              onPressed: _getImageCamera,
              icon: const Row(
                children: [Icon(Icons.camera_alt_outlined), Text("Tirar foto")],
              ),
            ),
            const Divider(),
            IconButton(
              onPressed: _getImageGallery,
              icon: const Row(
                children: [Icon(Icons.image_outlined), Text("Ver na galeria")],
              ),
            ),
            ButtonGlobalWidget(
              buttonStyle: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  ColorsApp.green100,
                ),
              ),
              onPressed: () {
                _cubit.newImage(_uid!, _selectedFile?.path);

                Navigator.pop(context);
              },
              width: width,
              child: const Text(
                "Atualizar",
                style: TextStyle(
                  color: ColorsApp.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _editPhoneNumber() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar Número?"),
        content: Form(
          key: _formKey,
          child: InputPerfilWidget(
            keyboardType: TextInputType.phone,
            label: "Digite seu novo whatsapp",
            textController: _textWhatsappController,
            format: [_formatWhatsappNumber],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Não"),
          ),
          TextButton(
            onPressed: () {
              _cubit.newWhatsapp(_uid!, _textWhatsappController.text);

              Navigator.pop(context);
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  void _editName() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Editar nome?"),
        content: Form(
          key: _formKey,
          child: InputPerfilWidget(
            keyboardType: TextInputType.text,
            label: "Digite seu novo nome",
            textController: _textNameController,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Não"),
          ),
          TextButton(
            onPressed: () {
              _cubit.newName(_uid!, _textNameController.text);

              Navigator.pop(context);
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ColorsApp.grey50,
      body: Column(
        children: [
          Container(
            width: width,
            height: height * 0.23,
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 16,
            ),
            decoration: const BoxDecoration(
              color: ColorsApp.white,
              border: Border(
                bottom: BorderSide(
                  color: ColorsApp.green100,
                  width: 1,
                ),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            child: BlocConsumer<PerfilCubit, PerfilState>(
              bloc: _cubit,
              listener: (context, state) {
                if (state is PerfilUpdatedSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Seus dados foram atualizados 👍"),
                    ),
                  );

                  setState(() {
                    _cubit.infoPerfil(_uid!);
                  });

                  return;
                }
              },
              builder: (context, state) {
                if (state is PerfilLoading) {
                  return const SkeletonInfoUserLoading();
                }

                if (state is PerfilError) {
                  return const Center(
                    child: Text("Erro ao puxar suas informações!!"),
                  );
                }

                if (state is InfoUser) {
                  final user = state.user;

                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 110,
                            height: 110,
                            decoration: BoxDecoration(
                              border: const GradientBoxBorder(
                                gradient: ColorsApp.linearGradientBorder,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(999),
                              color: ColorsApp.white,
                              image: _selectedFile != null
                                  ? DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(
                                        _selectedFile!,
                                        scale: 1,
                                      ),
                                    )
                                  : DecorationImage(
                                      fit: BoxFit.cover,
                                      image: CachedNetworkImageProvider(
                                        user.imageUser!,
                                      ),
                                    ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(999),
                                color: ColorsApp.green100,
                              ),
                              child: Center(
                                child: IconButton(
                                  onPressed: () => _showModal(width),
                                  icon: const Icon(
                                    Icons.edit_rounded,
                                    color: ColorsApp.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                user.nameUser!,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  color: ColorsApp.green100,
                                ),
                                onPressed: _editName,
                              ),
                            ],
                          ),
                          Text(user.emailUser!),
                          Row(
                            children: [
                              Text(user.whatsappUser!),
                              IconButton(
                                icon: const Icon(
                                  Icons.edit_rounded,
                                  color: ColorsApp.green100,
                                ),
                                onPressed: _editPhoneNumber,
                              ),
                            ],
                          ),
                          Text(
                            user.cityUser!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                }

                return Container();
              },
            ),
          ),
          const SizedBox(height: 19),
          const Expanded(
            child: PostsGridWidget(),
          ),
        ],
      ),
    );
  }
}
