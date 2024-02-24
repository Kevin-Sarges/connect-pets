import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingScreenWidget extends StatelessWidget {
  const LoadingScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Shimmer.fromColors(
            baseColor: ColorsApp.grey100,
            highlightColor: ColorsApp.green100,
            child: Image.asset(
              ImagesApp.patas,
              fit: BoxFit.cover,
              width: 200,
            ),
          ),
          SizedBox(
            width: 50,
            child: LinearProgressIndicator(
              borderRadius: BorderRadius.circular(10),
              backgroundColor: ColorsApp.grey100,
              color: ColorsApp.green100,
            ),
          ),
        ],
      ),
    );
  }
}
