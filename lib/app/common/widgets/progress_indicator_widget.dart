import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: ColorsApp.grey50,
    );
  }
}
