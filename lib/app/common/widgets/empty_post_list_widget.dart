import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:flutter/material.dart';

class EmptyPostListWidget extends StatelessWidget {
  const EmptyPostListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesApp.listaVazia,
            fit: BoxFit.cover,
            width: 200,
          ),
          const Text(
            "Nenhuma Postagem",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
