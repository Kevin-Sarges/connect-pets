import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/utils/strings_app.dart';
import 'package:connect_pets/app/common/widgets/divider_widgets.dart';
import 'package:connect_pets/app/common/widgets/inputs_widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/inputs_widgets/input_password_widget.dart';
import 'package:connect_pets/app/common/widgets/loading_widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/login/presenter/cubit/login_cubit.dart';
import 'package:connect_pets/app/features/login/presenter/cubit/login_state.dart';
import 'package:connect_pets/app/features/login/presenter/widget/button_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _cubit = GetIt.I.get<LoginCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textControllerEmail = TextEditingController();
  final _textControllerPassword = TextEditingController();
  final _nameApp = StringsApp.nameApp;

  bool _clickButton = false;
  bool _isHiddenText = true;

  void _hiddenText() {
    setState(() {
      _isHiddenText = !_isHiddenText;
    });
  }

  void _loginGoogle() {
    _cubit.google();

    setState(() {
      _clickButton = true;
    });
  }

  void _snackBarLogin(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );

    setState(() {
      _clickButton = false;
    });
  }

  void _refactorPassword() {
    Navigator.pushNamed(context, RoutesApp.refactorPassword);
  }

  void _navigate() {
    Navigator.pushNamedAndRemoveUntil(
      context,
      RoutesApp.home,
      (_) => false,
    );
  }

  void _loginEmailPassword() {
    setState(() {
      _clickButton = true;
    });
    _cubit.emailPassword(UserModel(
      emailUser: _textControllerEmail.text,
      passwordUser: _textControllerPassword.text,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener(
        bloc: _cubit,
        listener: (context, state) {
          if (state is LoginError) {
            _snackBarLogin("Email ou senha incorretos");

            return;
          }

          if (state is LoginSuccess) {
            _navigate();

            return;
          }
        },
        child: Stack(
          children: [
            Shimmer.fromColors(
              baseColor: ColorsApp.green150,
              highlightColor: ColorsApp.green100,
              child: Container(
                height: h,
                width: w,
                color: ColorsApp.green200,
              ),
            ),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  Image.asset(
                    ImagesApp.logo,
                    width: 200,
                  ),
                  Text(
                    _nameApp,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 30,
                      color: ColorsApp.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 21,
                ),
                width: w,
                height: h * 0.5,
                decoration: const BoxDecoration(
                  color: ColorsApp.green50,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Faça Login',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputFormWidget(
                            keyboardType: TextInputType.emailAddress,
                            label: "Email",
                            icon: Icons.person,
                            textController: _textControllerEmail,
                          ),
                          InputPasswordWidget(
                            textEditingController: _textControllerPassword,
                            icon: Icons.lock,
                            label: "Senha",
                            onTap: _hiddenText,
                            keyBoardType: TextInputType.visiblePassword,
                            obscureText: _isHiddenText,
                            iconsObscure: _isHiddenText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed:
                              _clickButton ? null : () => _loginEmailPassword(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.green100,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 48,
                              vertical: 10,
                            ),
                          ),
                          child: _clickButton
                              ? const ProgressIndicatorWidget(
                                  color: ColorsApp.white,
                                )
                              : const Text(
                                  "Entrar",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: ColorsApp.white,
                                  ),
                                ),
                        ),
                        TextButton(
                          onPressed: () => _refactorPassword(),
                          child: const Text(
                            "Esqueciminha senha",
                            style: TextStyle(
                              color: ColorsApp.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 28),
                    const DividerWidget(),
                    const SizedBox(height: 11),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonLoginWidget(
                          clickButton: _clickButton,
                          onPressed: () => _loginGoogle(),
                          background: ColorsApp.white,
                          image: ImagesApp.google,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
