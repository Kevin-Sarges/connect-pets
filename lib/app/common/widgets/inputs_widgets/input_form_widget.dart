import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget({
    super.key,
    required this.keyboardType,
    required this.icon,
    required this.label,
    required this.textController,
    this.format,
  });

  final String label;
  final IconData icon;
  final TextInputType keyboardType;
  final TextEditingController textController;
  final List<TextInputFormatter>? format;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Campo esta vazio';
        }

        return null;
      },
      controller: textController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: ColorsApp.green100,
        ),
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorsApp.green100,
        ),
      ),
      inputFormatters: format,
    );
  }
}
