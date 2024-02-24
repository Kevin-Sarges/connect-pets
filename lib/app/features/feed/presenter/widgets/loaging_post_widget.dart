import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoagingPostWidget extends StatelessWidget {
  const LoagingPostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 3),
        Container(
          width: width,
          height: 550,
          color: ColorsApp.white,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 11,
                  horizontal: 8,
                ),
                child: Row(
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorsApp.grey100,
                      highlightColor: ColorsApp.grey50,
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorsApp.grey100,
                          borderRadius: BorderRadius.circular(999),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Shimmer.fromColors(
                      baseColor: ColorsApp.grey100,
                      highlightColor: ColorsApp.grey50,
                      child: Container(
                        width: 200,
                        height: 25,
                        decoration: BoxDecoration(
                            color: ColorsApp.grey100,
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 9),
              Shimmer.fromColors(
                baseColor: ColorsApp.grey100,
                highlightColor: ColorsApp.grey50,
                child: Container(
                  width: width,
                  height: 400,
                  color: ColorsApp.grey100,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Shimmer.fromColors(
                      baseColor: ColorsApp.grey100,
                      highlightColor: ColorsApp.grey50,
                      child: Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          color: ColorsApp.grey100,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(width: 7),
                    Shimmer.fromColors(
                      baseColor: ColorsApp.grey100,
                      highlightColor: ColorsApp.grey50,
                      child: Container(
                        width: 100,
                        height: 40,
                        decoration: BoxDecoration(
                          color: ColorsApp.grey100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
