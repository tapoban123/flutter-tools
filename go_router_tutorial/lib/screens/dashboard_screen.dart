import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  final double monthlyIncome;
  const DashboardScreen({
    super.key,
    required this.monthlyIncome,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your montly income: $monthlyIncome",
              style: const TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
