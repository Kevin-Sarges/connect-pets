import 'package:flutter/material.dart';

class InfoPetWidget extends StatelessWidget {
  const InfoPetWidget({
    super.key,
    required this.info,
    required this.title,
  });

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
