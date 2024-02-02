import 'dart:io';

import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/common/widgets/divider_widgets.dart';
import 'package:connect_pets/app/common/widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/input_password_widget.dart';
import 'package:connect_pets/app/common/widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/login/presenter/widget/button_login_widget.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_cubit.dart';
import 'package:connect_pets/app/features/signup/presenter/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _cubit = GetIt.I.get<SignupCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textControllerUserName = TextEditingController();
  final _textControllerNumberPhone = TextEditingController();
  final _textControllerCity = TextEditingController();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _textControllerConfirmPassword = TextEditingController();

  final _colorBg = ColorsApp.green50;
  final _formatWhatsappNumber = MaskTextInputFormatter(
    mask: "(##) # ####-####",
    filter: {"#": RegExp(r'[0-9]')},
  );

  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _clickButton = false;
  File? _selectedFile;

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

  Future<XFile?> _getImage() async {
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

  void _creatUserEmailPassword() async {
    final whatsappValue = int.parse(_textControllerNumberPhone.text);

    if (_textControllerPassword.text != _textControllerConfirmPassword.text ||
        _selectedFile == null) {
      setState(() {
        _clickButton = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Confirmação de Senha incorreta!!"),
        ),
      );
    } else {
      setState(() {
        _clickButton = true;

        _cubit.signupUserEmailPassword(
          UserModel(
            imageUser: _selectedFile?.path,
            cityUser: _textControllerCity.text,
            emailUser: _textControllerEmail.text,
            nameUser: _textControllerUserName.text,
            passwordUser: _textControllerPassword.text,
            whatsappUser: whatsappValue,
          ),
        );
      });
    }
  }

  void _creatUserGoogle() {
    setState(() {
      _clickButton = true;
    });

    _cubit.signupGoogle();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: _colorBg,
      appBar: AppBar(
        title: const Text("Cadastro"),
        centerTitle: true,
        backgroundColor: _colorBg,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RoutesApp.initialPage,
              (_) => false,
            );
          },
        ),
      ),
      body: SafeArea(
        child: BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupError) {
              setState(() {
                _clickButton = false;
              });

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error.errorMessage),
                ),
              );

              return;
            }

            if (state is SignupEmailPassWordSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesApp.home,
                (_) => false,
              );
            }

            if (state is SignupSuccess) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesApp.finishSignup,
                (_) => false,
              );
            }
          },
          bloc: _cubit,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
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
                                : null,
                          ),
                          child: _selectedFile == null
                              ? IconButton(
                                  icon: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.edit,
                                        color: ColorsApp.green100,
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        "Foto Perfil",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorsApp.green100,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: () => _getImage(),
                                )
                              : null,
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.name,
                          icon: Icons.person,
                          label: "Nome de usuário",
                          textController: _textControllerUserName,
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.phone,
                          icon: Icons.call,
                          label: "Numero do whatsapp",
                          textController: _textControllerNumberPhone,
                          format: [_formatWhatsappNumber],
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.text,
                          icon: Icons.location_city,
                          label: "Sua cidade",
                          textController: _textControllerCity,
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.emailAddress,
                          icon: Icons.email,
                          label: "Email",
                          textController: _textControllerEmail,
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
                          textEditingController: _textControllerConfirmPassword,
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
                  const SizedBox(height: 15),
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
                    onPressed:
                        _clickButton ? null : () => _creatUserEmailPassword(),
                    width: _clickButton ? 100 : w,
                    child: _clickButton
                        ? const ProgressIndicatorWidget()
                        : const Text(
                            "Criar Conta",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: ColorsApp.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 30),
                  const DividerWidget(),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonLoginWidget(
                        clickButton: _clickButton,
                        onPressed: () => _creatUserGoogle(),
                        background: ColorsApp.white,
                        image: ImagesApp.google,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
