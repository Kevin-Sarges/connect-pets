import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class InputPasswordWidget extends StatelessWidget {
  const InputPasswordWidget({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.label,
    required this.onTap,
    required this.keyBoardType,
    required this.obscureText,
    required this.iconsObscure,
  });

  final String label;
  final TextInputType keyBoardType;
  final TextEditingController textEditingController;
  final bool? obscureText;
  final VoidCallback onTap;
  final IconData icon;
  final IconData iconsObscure;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return "Campo esta vazio!!";
        }

        return null;
      },
      controller: textEditingController,
      keyboardType: keyBoardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorsApp.green100,
          ),
          labelText: label,
          labelStyle: const TextStyle(color: ColorsApp.green100),
          suffixIcon: InkWell(
            onTap: onTap,
            child: Icon(
              iconsObscure,
              color: ColorsApp.green100,
            ),
          )),
    );
  }
}
