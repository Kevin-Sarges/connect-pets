import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/features/login/presenter/widget/button_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool clickButton = false;

  void click() {
    setState(() {
      clickButton = true;
    });

    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          clickButton = false;
        });
      },
    );
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
                const Text(
                  'Connect Pets',
                  style: TextStyle(
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
                horizontal: 50,
              ),
              width: w,
              height: h * 0.3,
              decoration: const BoxDecoration(
                color: ColorsApp.green50,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonLoginWidget(
                    clickButton: clickButton,
                    width: w,
                    background: ColorsApp.white,
                    colorText: ColorsApp.black,
                    image: ImagesApp.google,
                    text: 'Google',
                    onPressed: () {
                      click();
                    },
                  ),
                  const SizedBox(height: 10),
                  ButtonLoginWidget(
                    clickButton: clickButton,
                    width: w,
                    background: ColorsApp.blue,
                    colorText: ColorsApp.white,
                    image: ImagesApp.facebook,
                    text: 'Facebook',
                    onPressed: () {
                      click();
                    },
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
