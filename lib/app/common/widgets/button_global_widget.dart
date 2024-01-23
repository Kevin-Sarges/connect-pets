import 'package:flutter/material.dart';

class ButtonGlobalWidget extends StatelessWidget {
  const ButtonGlobalWidget({
    super.key,
    required this.child,
    required this.buttonStyle,
    required this.onPressed,
    required this.width,
  });

  final VoidCallback? onPressed;
  final ButtonStyle buttonStyle;
  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        width: width,
        duration: const Duration(seconds: 6),
        child: ElevatedButton(
          onPressed: onPressed,
          style: buttonStyle,
          child: child,
        ),
      ),
    );
  }
}
