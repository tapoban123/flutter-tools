import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String buttonText;
  final Color backgroundColor;
  final VoidCallback onTap;

  const HomeButton({
    super.key,
    required this.backgroundColor,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: backgroundColor,
      ),
      child: Text(buttonText),
    );
  }
}
