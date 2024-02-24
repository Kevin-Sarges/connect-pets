import 'package:connect_pets/app/common/utils/images_app.dart';
import 'package:flutter/material.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key, required this.messageError});

  final String messageError;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImagesApp.error,
            fit: BoxFit.cover,
            width: 100,
          ),
          const SizedBox(height: 10),
          Text(
            messageError,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
