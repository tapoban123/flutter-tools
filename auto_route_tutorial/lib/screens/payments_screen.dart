import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/auto_route.gr.dart';
import 'package:auto_route_tutorial/widgets/home_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Payments Screen")),
      body: Column(
        children: [
          Text("Payments Screen"),
          HomeButton(
            backgroundColor: Colors.teal,
            buttonText: "Click",
            onTap: () {
              context.router.push(HomeScreen());
            },
          ),
        ],
      ),
    );
  }
}
