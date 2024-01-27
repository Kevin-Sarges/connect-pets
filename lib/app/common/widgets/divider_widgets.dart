import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/widgets/line_widget.dart';
import 'package:flutter/material.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 16,
      child: Stack(
        children: [
          const Positioned(
            left: 174,
            top: 0,
            child: Text(
              'OU',
              style: TextStyle(
                color: ColorsApp.black,
                fontSize: 14,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
          Positioned(
            left: 204,
            top: 8,
            child: LineWidget(
              width: w * 0.5,
              color: ColorsApp.grey150,
            ),
          ),
          Positioned(
            left: 0,
            top: 8,
            child: LineWidget(
              width: w * 0.4,
              color: ColorsApp.grey150,
            ),
          ),
        ],
      ),
    );
  }
}
