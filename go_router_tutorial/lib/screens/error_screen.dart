import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              "An error occurred.",
              style: TextStyle(
                color: Colors.red,
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
