import 'package:flutter/material.dart';

class PricingScreen extends StatelessWidget {
  final double amount;
  const PricingScreen({
    super.key,
    required this.amount,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pricing Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your amount: ₹$amount.",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
