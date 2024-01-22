import 'package:connect_pets/app/common/model/user_model.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_cubit.dart';
import 'package:connect_pets/app/features/finish_signup/presenter/cubit/finish_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

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

  bool _clickButton = false;

  void _creatUserEmailPassword() {
    final whatsappValue = int.parse(_textControllerWhatsapp.text);

    setState(() {
      _clickButton = true;

      _cubit.finishSignupUser(
        UserModel(
          cityUser: _textControllerCity.text,
          nameUser: _textControllerNameUser.text,
          whatsappUser: whatsappValue,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
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
                        ),
                        InputFormWidget(
                          keyboardType: TextInputType.text,
                          icon: Icons.location_city,
                          label: "Cidade",
                          textController: _textControllerCity,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 21),
                  AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    child: Center(
                      child: ElevatedButton(
                        onPressed:
                            _clickButton ? null : () => _creatUserEmailPassword(),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
