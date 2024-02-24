import 'package:connect_pets/app/common/utils/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonPostsLoadingWidget extends StatelessWidget {
  SkeletonPostsLoadingWidget({super.key});

  final _list = [
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: _list.length,
      padding: const EdgeInsets.all(6),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemBuilder: (context, index) => Shimmer.fromColors(
        baseColor: ColorsApp.grey100,
        highlightColor: ColorsApp.grey50,
        child: Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
        ),
      ),
    );
  }
}
