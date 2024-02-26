import 'package:cached_network_image/cached_network_image.dart';
import 'package:connect_pets/app/common/entity/post_entity.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/features/donate/utils/items_drop_down_menu.dart';
import 'package:connect_pets/app/features/post/presenter/cubit/post_cubit.dart';
import 'package:connect_pets/app/features/post/presenter/cubit/post_state.dart';
import 'package:connect_pets/app/features/post/presenter/widget/info_pet_post_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key, required this.post});

  final PostEntity post;

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final _cubit = GetIt.I.get<PostCubit>();
  final items = ItemsListDropdownMenu.items;

  late TextEditingController _textControllerDropdown;
  late TextEditingController _textControllerAge;

  String? _selectedItem;
  bool _editClick = false;

  @override
  void initState() {
    super.initState();

    _textControllerAge = TextEditingController(text: widget.post.agePet);
    _textControllerDropdown =
        TextEditingController(text: widget.post.genderPet);
  }

  void _editPost() {
    setState(() {
      _editClick = true;
    });
  }

  void _saveEditPost() {
    _cubit.edit(
      _textControllerAge.text,
      _selectedItem,
      widget.post.id!,
    );
  }

  void _deletedPost() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Deletar"),
        content: const Text("Você deseja deletar esse doação?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Não"),
          ),
          TextButton(
            onPressed: () => _cubit.delete(widget.post.id!),
            child: const Text("Sim"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final post = widget.post;

    return Scaffold(
      body: SafeArea(
        child: BlocListener<PostCubit, PostState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is PostUpdatedSuccess) {
              setState(() {
                _editClick = false;

                widget.post.genderPet = _selectedItem ?? widget.post.genderPet;
                widget.post.agePet = _textControllerAge.text;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Doação atualizada!!"),
                ),
              );

              return;
            }

            if (state is PostDeletedSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesApp.home,
                (_) => false,
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Postagem deletada"),
                ),
              );

              return;
            }

            if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Erro 😕..."),
                ),
              );

              return;
            }
          },
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: width,
                      height: 380,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: CachedNetworkImageProvider(post.urlImage!),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(
                        11,
                        40,
                        11,
                        0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InfoPetPostWidget(
                            title: "Idade do pet",
                            subtitle: _editClick
                                ? SizedBox(
                                    width: width * 0.45,
                                    child: TextFormField(
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Campo esta vazio';
                                        }

                                        return null;
                                      },
                                      controller: _textControllerAge,
                                      decoration: InputDecoration(
                                        hintText: post.agePet!,
                                      ),
                                    ),
                                  )
                                : Text(
                                    post.agePet!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                          InfoPetPostWidget(
                            title: "Sexo do pet",
                            subtitle: _editClick
                                ? DropdownMenu(
                                    width: width * 0.45,
                                    hintText: "Selecione o gênero",
                                    controller: _textControllerDropdown,
                                    inputDecorationTheme:
                                        const InputDecorationTheme(
                                      filled: true,
                                      fillColor: ColorsApp.white,
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
                                  )
                                : Text(
                                    post.genderPet!,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: width,
                      height: 80,
                      padding: const EdgeInsets.all(11),
                      color: ColorsApp.white,
                      child: _editClick
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonGlobalWidget(
                                  buttonStyle: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      ColorsApp.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _editClick = false;
                                    });
                                  },
                                  width: width * 0.40,
                                  child: const Text(
                                    "Cancelar",
                                    style: TextStyle(color: ColorsApp.white),
                                  ),
                                ),
                                ButtonGlobalWidget(
                                  buttonStyle: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      ColorsApp.green50,
                                    ),
                                  ),
                                  onPressed: _saveEditPost,
                                  width: width * 0.40,
                                  child: const Text(
                                    "Salvar",
                                    style: TextStyle(
                                      color: ColorsApp.green100,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonGlobalWidget(
                                  buttonStyle: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      ColorsApp.red,
                                    ),
                                  ),
                                  onPressed: _deletedPost,
                                  width: width * 0.40,
                                  child: const Text(
                                    "Deletar",
                                    style: TextStyle(color: ColorsApp.white),
                                  ),
                                ),
                                ButtonGlobalWidget(
                                  buttonStyle: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                      ColorsApp.green50,
                                    ),
                                  ),
                                  onPressed: _editPost,
                                  width: width * 0.40,
                                  child: const Text(
                                    "Editar",
                                    style: TextStyle(
                                      color: ColorsApp.green100,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: ColorsApp.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Voltar",
                      style: TextStyle(
                        color: ColorsApp.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
