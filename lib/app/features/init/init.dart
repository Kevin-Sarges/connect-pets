import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/utils/strings_app.dart';
import 'package:connect_pets/app/common/widgets/line_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class InitScreen extends StatefulWidget {
  const InitScreen({super.key});

  @override
  State<InitScreen> createState() => _InitScreenState();
}

class _InitScreenState extends State<InitScreen> {
  final _nameApp = StringsApp.nameApp;

  void _criarConta() {
    Navigator.pushNamed(context, RoutesApp.signup);
  }

  void _loginScreen() {
    Navigator.pushNamed(context, RoutesApp.login);
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
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
              height: h * 0.4,
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
                  Text(
                    "Seja bem-vindo ao $_nameApp, o\nseu aplicativo de adoção/doação\nde animais de estimação.",
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 18),
                  ElevatedButton(
                    onPressed: () => _criarConta(),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 10,
                      ),
                      backgroundColor: ColorsApp.white,
                    ),
                    child: const Text(
                      "Criar conta",
                      style: TextStyle(
                        color: ColorsApp.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  LineWidget(
                    width: w,
                    color: ColorsApp.green100,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Ja possui um conta? Faça login aqui.",
                    style: TextStyle(fontSize: 16),
                  ),
                  InkWell(
                    onTap: () => _loginScreen(),
                    child: const Text(
                      "Entrar",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
