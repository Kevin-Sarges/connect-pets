import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/widgets/loading_widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({
    super.key,
    required this.clickButton,
    required this.onPressed,
    required this.background,
    required this.image,
  });

  final bool clickButton;
  final VoidCallback? onPressed;
  final Color background;
  final String image;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: clickButton ? null : onPressed,
      style: clickButton
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
          : ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                background,
              ),
              padding: MaterialStateProperty.all(
                const EdgeInsets.symmetric(
                  vertical: 17,
                ),
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
              )),
      child: clickButton
          ? const ProgressIndicatorWidget(
              color: ColorsApp.white,
            )
          : Image.asset(
              image,
              width: 30,
            ),
    );
  }
}
