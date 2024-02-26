import 'package:flutter/material.dart';

class InfoPetPostWidget extends StatelessWidget {
  const InfoPetPostWidget({
    super.key,
    required this.subtitle,
    required this.title,
  });

  final String title;
  final Widget subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        subtitle,
      ],
    );
  }
}
