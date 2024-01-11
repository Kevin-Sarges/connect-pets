import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/features/splash/presenter/controller/splash_cubit.dart';
import 'package:connect_pets/app/features/splash/presenter/controller/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _cubit = GetIt.I.get<SplashCubit>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _cubit.checkLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is SplashLogado) {
            Navigator.of(context).pushReplacementNamed(RoutesApp.home);
          }
          if (state is SplashNaoLogado) {
            Navigator.of(context).pushReplacementNamed(RoutesApp.initialPage);
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: ColorsApp.linearGradientGreen,
          ),
          child: Center(
            child: Image.asset(
              ImagesApp.logo,
            ),
          ),
        ),
      ),
    );
  }
}
