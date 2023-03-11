import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/strings_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: ColorsApp.linearGradientGreen,
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(ImagesApp.logo),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      StringsApp.nameApp,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    _loginButton(
                      nameButton: StringsApp.facaLoginCom(
                        StringsApp.apple,
                      ),
                      icon: ImagesApp.apple,
                      background: Colors.black,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {
                        print('oi');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginButton(
                      nameButton: StringsApp.facaLoginCom(
                        StringsApp.google,
                      ),
                      icon: ImagesApp.google,
                      background: Colors.blue,
                      textColor: Colors.white,
                      onTap: () {
                        print('oi');
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _loginButton(
                      nameButton: StringsApp.facaLoginCom(
                        StringsApp.facebook,
                      ),
                      icon: ImagesApp.facebook,
                      textColor: Colors.white,
                      background: Colors.blue[800]!,
                      onTap: () {
                        print('oi');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loginButton({
    required String nameButton,
    required String icon,
    required Color background,
    required VoidCallback onTap,
    Color? iconColor,
    Color? textColor,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        width: double.maxFinite,
        decoration: BoxDecoration(
          color: background,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              height: 35,
              color: iconColor,
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                nameButton,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
