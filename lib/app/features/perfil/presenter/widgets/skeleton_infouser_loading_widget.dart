import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonInfoUserLoading extends StatelessWidget {
  const SkeletonInfoUserLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Shimmer.fromColors(
          baseColor: ColorsApp.grey100,
          highlightColor: ColorsApp.grey50,
          child: Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: ColorsApp.white,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Shimmer.fromColors(
              baseColor: ColorsApp.grey100,
              highlightColor: ColorsApp.grey50,
              child: Container(
                width: width * 0.4,
                height: 25,
                decoration: BoxDecoration(
                  color: ColorsApp.grey100,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: ColorsApp.grey100,
              highlightColor: ColorsApp.grey50,
              child: Container(
                width: width * 0.4,
                height: 20,
                decoration: BoxDecoration(
                  color: ColorsApp.grey100,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: ColorsApp.grey100,
              highlightColor: ColorsApp.grey50,
              child: Container(
                width: width * 0.4,
                height: 20,
                decoration: BoxDecoration(
                  color: ColorsApp.grey100,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 5),
            Shimmer.fromColors(
              baseColor: ColorsApp.grey100,
              highlightColor: ColorsApp.grey50,
              child: Container(
                width: width * 0.4,
                height: 23,
                decoration: BoxDecoration(
                  color: ColorsApp.grey100,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
