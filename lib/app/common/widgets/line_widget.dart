import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: ColorsApp.grey150,
          ),
        ),
      ),
    );
  }
}
