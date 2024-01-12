import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/widgets/divider_widgets.dart';
import 'package:connect_pets/app/common/widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/input_password_widget.dart';
import 'package:connect_pets/app/features/login/presenter/widget/button_login_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.green50,
      body: SafeArea(
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
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      backgroundColor: ColorsApp.green100,
                    ),
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(fontWeight: FontWeight.bold),
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
                      onPressed: () {},
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
    );
  }
}
