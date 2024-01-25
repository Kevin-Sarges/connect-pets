import 'package:flutter/material.dart';

class LineWidget extends StatelessWidget {
  const LineWidget({super.key, required this.width, required this.color});

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: color,
          ),
        ),
      ),
    );
  }
}
