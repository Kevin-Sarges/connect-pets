import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
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

  bool _isHiddenPassword = true;
  bool _isHiddenConfirmPassword = true;
  bool _clickButton = false;

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
    final whatsappValue = int.parse(_textControllerNumberPhone.text);

    if (_textControllerPassword.text != _textControllerConfirmPassword.text) {
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
    return Scaffold(
      backgroundColor: ColorsApp.green50,
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
                  const Text(
                    "Você pode escolher a forma\nde criar sua conta, vai da\nsua preferência.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 23),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
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
                  const SizedBox(height: 23),
                  AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    child: Center(
                      child: ElevatedButton(
                        onPressed: _clickButton
                            ? null
                            : () => _creatUserEmailPassword(),
                        style: _clickButton
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
                        child: _clickButton
                            ? const ProgressIndicatorWidget()
                            : const Text(
                                "Criar Conta",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorsApp.white,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const DividerWidget(),
                  const SizedBox(height: 20),
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
