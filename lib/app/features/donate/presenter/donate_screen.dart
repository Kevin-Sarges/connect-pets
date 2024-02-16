import 'dart:io';

import 'package:connect_pets/app/common/model/post_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/common/widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/donate/presenter/cubit/donate_cubit.dart';
import 'package:connect_pets/app/features/donate/presenter/cubit/donate_state.dart';
import 'package:connect_pets/app/features/donate/utils/items_drop_down_menu.dart';
import 'package:connect_pets/app/features/home/presenter/home_screen.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class DonateScreen extends StatefulWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  State<DonateScreen> createState() => _DoarScreenState();
}

class _DoarScreenState extends State<DonateScreen> {
  final _cubit = GetIt.I.get<DonateCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textControllerInput = TextEditingController();
  final _textControllerDropdown = TextEditingController();

  bool _clickButton = false;
  File? _selectedFile;
  String? _selectedItem;

  final items = ItemsListDropdownMenu.items;

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

  void _postDonate() {
    setState(() {
      _clickButton = true;

      _cubit.donate(
        PostModel(
          urlImage: _selectedFile?.path,
          agePet: _textControllerInput.text,
          genderPet: _selectedItem,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsApp.grey50,
      body: BlocListener<DonateCubit, DonateState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is DonateError) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Erro na hora de postar !!"),
              ),
            );

            return;
          }

          if (state is DonateSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            );

            setState(() {
              _selectedFile = null;
            });

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Postado com sucesso 🤗"),
              ),
            );

            return;
          }
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DottedBorder(
                    borderType: BorderType.RRect,
                    color: ColorsApp.green100,
                    radius: const Radius.circular(6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: width,
                        height: 400,
                        decoration: BoxDecoration(
                          color: ColorsApp.white,
                          image: _selectedFile != null
                              ? DecorationImage(
                                  fit: BoxFit.cover,
                                  image: FileImage(
                                    _selectedFile!,
                                    scale: 1,
                                  ),
                                )
                              : null,
                        ),
                        child: _selectedFile == null
                            ? IconButton(
                                icon: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_box_outlined,
                                      color: ColorsApp.green100,
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Selecione uma Foto",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorsApp.green100,
                                      ),
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(
                                      width: width,
                                      height: 160,
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
                                              children: [
                                                Icon(Icons.camera_alt_outlined),
                                                Text("Tirar foto")
                                              ],
                                            ),
                                          ),
                                          const Divider(),
                                          IconButton(
                                            onPressed: _getImageGallery,
                                            icon: const Row(
                                              children: [
                                                Icon(Icons.image_outlined),
                                                Text("Ver na galeria")
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )
                            : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: _textControllerInput,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Campo esta vazio';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: ColorsApp.white,
                        label: Text("Idade do Pet"),
                        hintText: "Ex: 6 meses",
                        hintStyle: TextStyle(
                          color: ColorsApp.grey100,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsApp.green100,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: ColorsApp.green100,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  DropdownMenu(
                    width: width * 0.96,
                    hintText: "Selecione o gênero",
                    controller: _textControllerDropdown,
                    inputDecorationTheme: const InputDecorationTheme(
                      filled: true,
                      fillColor: ColorsApp.white,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: ColorsApp.green100,
                        ),
                      ),
                    ),
                    dropdownMenuEntries: items.map(
                      (item) {
                        return DropdownMenuEntry(
                          value: item,
                          label: item,
                        );
                      },
                    ).toList(),
                    menuHeight: 200,
                    onSelected: (String? item) {
                      setState(() {
                        _selectedItem = item;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  ButtonGlobalWidget(
                    buttonStyle: _clickButton
                        ? ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 15,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                          )
                        : ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                            ),
                            backgroundColor: ColorsApp.green100,
                          ),
                    onPressed: _clickButton
                        ? null
                        : () {
                            if (_formKey.currentState!.validate()) {
                              _postDonate();
                            }
                          },
                    width: _clickButton ? 100 : width,
                    child: _clickButton
                        ? const ProgressIndicatorWidget(
                            color: ColorsApp.white,
                          )
                        : const Text(
                            "Posta",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorsApp.white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
