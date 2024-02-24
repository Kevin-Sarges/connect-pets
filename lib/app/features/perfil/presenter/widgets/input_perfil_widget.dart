import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPerfilWidget extends StatelessWidget {
  const InputPerfilWidget({
    super.key,
    required this.label,
    required this.keyboardType,
    required this.textController,
    this.format,
  });

  final String label;
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
        labelText: label,
        labelStyle: const TextStyle(
          color: ColorsApp.green100,
        ),
        border: const OutlineInputBorder()
      ),
      inputFormatters: format,
    );
  }
}
