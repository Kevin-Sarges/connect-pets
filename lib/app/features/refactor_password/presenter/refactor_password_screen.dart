import 'package:connect_pets/app/common/entity/user_entity.dart';
import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/routes_app.dart';
import 'package:connect_pets/app/common/widgets/button_global_widget.dart';
import 'package:connect_pets/app/common/widgets/input_form_widget.dart';
import 'package:connect_pets/app/common/widgets/progress_indicator_widget.dart';
import 'package:connect_pets/app/features/refactor_password/presenter/cubit/refactor_password_cubit.dart';
import 'package:connect_pets/app/features/refactor_password/presenter/cubit/refactor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class RefactorPasswordScreen extends StatefulWidget {
  const RefactorPasswordScreen({super.key});

  @override
  State<RefactorPasswordScreen> createState() => _RefactorPasswordScreenState();
}

class _RefactorPasswordScreenState extends State<RefactorPasswordScreen> {
  final _cubit = GetIt.I.get<RefactorPasswordCubit>();
  final _formKey = GlobalKey<FormState>();
  final _textControllerEmail = TextEditingController();

  bool _clickButton = false;

  void _sendEmail() {
    setState(() {
      _clickButton = true;
    });

    _cubit.refactorPassword(
      UserEntity(emailUser: _textControllerEmail.text),
    );
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: ColorsApp.green50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: BlocListener<RefactorPasswordCubit, RefactorPasswordState>(
            bloc: _cubit,
            listener: (context, state) {
              if (state is RefactorPasswordError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Email não encontrado!!"),
                  ),
                );

                setState(() {
                  _clickButton = false;
                });

                return;
              }

              if (state is RefactorPasswordSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                        "Email enviado com sucesso\nVerifique a usa caixa de email !!"),
                  ),
                );

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  RoutesApp.login,
                  (_) => false,
                );

                return;
              }
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Informe o seu e-mail da sua\nconta e nós enviaremos um\nlink para recuperação de\nsenha.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 132),
                Form(
                  key: _formKey,
                  child: InputFormWidget(
                    keyboardType: TextInputType.emailAddress,
                    icon: Icons.email,
                    label: "Email",
                    textController: _textControllerEmail,
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
                  onPressed: _clickButton ? null : () => _sendEmail(),
                  child: _clickButton
                      ? const ProgressIndicatorWidget()
                      : const Text(
                    "Enviar",
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
    );
  }
}
