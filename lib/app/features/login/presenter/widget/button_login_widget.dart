import 'package:connect_pets/app/common/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({
    super.key,
    required this.clickButton,
    required this.width,
    required this.onPressed,
    required this.background,
    required this.colorText,
    required this.image,
    required this.text,
  });

  final bool clickButton;
  final double width;
  final VoidCallback? onPressed;
  final Color background;
  final String text;
  final String image;
  final Color colorText;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: clickButton ? 100 : width,
      child: ElevatedButton(
          onPressed: clickButton ? null : onPressed,
          style: clickButton
              ? ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99),
                    ),
                  ),
                )
              : ElevatedButton.styleFrom(
                  backgroundColor: background,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                ),
          child: clickButton
              ? const ProgressIndicatorWidget()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      image,
                      width: 30,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      text,
                      style: TextStyle(
                        color: colorText,
                      ),
                    ),
                  ],
                )),
    );
  }
}
