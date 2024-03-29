import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/utils/strings_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/common/widgets/inputs_widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/inputs_widgets/input_password_widget.dart';
import 'package:connect_pets/app/common/widgets/loading_widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_cubit.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FinishSignupScreen extends StatefulWidget {
  const FinishSignupScreen({super.key});

  @override
  State<FinishSignupScreen> createState() => _FinishSignupScreenState();
}

class _FinishSignupScreenState extends State<FinishSignupScreen> {
  final _cubit = GetIt.I.get<FinishCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textControllerNameUser = TextEditingController();
  final _textControllerWhatsapp = TextEditingController();
  final _textControllerCity = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _textControllerConfirPassword = TextEditingController();

  final _items = StringsApp.listCity;
  final _formatWhatsappNumber = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _clickButton = false;
  String? _selectedItem;

  void _hiddenPassword() {
    setState(() {
      _isHiddenPassword = !_isHiddenPassword;
    });
  }

  void _hiddenConfirmPassword() {
    setState(() {
      _isHiddenConfirmPassword = !_isHiddenConfirmPassword;
    });
  }

  void _creatUserEmailPassword() {
    if (_textControllerPassword.text == _textControllerConfirPassword.text) {
      setState(() {
        _clickButton = true;

        _cubit.finishSignupUser(
          UserModel(
            cityUser: _selectedItem,
            nameUser: _textControllerNameUser.text,
            passwordUser: _textControllerPassword.text,
            whatsappUser: _textControllerWhatsapp.text,
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Confirmação de senha errada!!"),
        ),
      );

      setState(() {
        _clickButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsApp.green50,
      body: SafeArea(
        child: BlocListener<FinishCubit, FinishSignupState>(
          bloc: _cubit,
          listener: (context, state) {
            if (state is FinishSignupError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.errorMessage),
                ),
              );

              return;
            }

            if (state is FinishSignupSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesApp.home,
                (_) => false,
              );

              return;
            }
          },
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Forneça os dados que estão\nfaltando, pois são\nimportantes para o uso do\naplicativo.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 43),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        InputFormWidget(
                          keyboardType: TextInputType.text,
                          icon: Icons.person,
                          label: "Nome Usuário",
                          textController: _textControllerNameUser,
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.phone,
                          icon: Icons.phone,
                          label: "Whatsapp",
                          textController: _textControllerWhatsapp,
                          format: [_formatWhatsappNumber],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_city_rounded,
                              color: ColorsApp.green100,
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: DropdownMenu(
                                width: w * 0.81,
                                hintText: "Selecione a Cidade",
                                label: const Text(
                                  "Cidade",
                                  style: TextStyle(
                                    color: ColorsApp.green100,
                                  ),
                                ),
                                controller: _textControllerCity,
                                inputDecorationTheme:
                                const InputDecorationTheme(
                                  filled: true,
                                  fillColor: ColorsApp.green50,
                                ),
                                dropdownMenuEntries: _items.map(
                                      (item) {
                                    return DropdownMenuEntry(
                                      value: item,
                                      label: item,
                                    );
                                  },
                                ).toList(),
                                onSelected: (String? item) {
                                  setState(() {
                                    _selectedItem = item;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        InputPasswordWidget(
                          textEditingController: _textControllerPassword,
                          icon: Icons.lock,
                          label: "Senha",
                          onTap: _hiddenPassword,
                          keyBoardType: TextInputType.visiblePassword,
                          obscureText: _isHiddenPassword,
                          iconsObscure: _isHiddenPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        InputPasswordWidget(
                          textEditingController: _textControllerConfirPassword,
                          icon: Icons.lock,
                          label: "Confirmar Senha",
                          onTap: _hiddenConfirmPassword,
                          keyBoardType: TextInputType.visiblePassword,
                          obscureText: _isHiddenConfirmPassword,
                          iconsObscure: _isHiddenConfirmPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 21),
                  ButtonGlobalWidget(
                    width: _clickButton ? 100 : w,
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
                              horizontal: 48,
                              vertical: 15,
                            ),
                            backgroundColor: ColorsApp.green100,
                          ),
                    onPressed:
                        _clickButton ? null : () => _creatUserEmailPassword(),
                    child: _clickButton
                        ? const ProgressIndicatorWidget(
                            color: ColorsApp.white,
                          )
                        : const Text(
                            "Criar Conta",
                            style: TextStyle(
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
