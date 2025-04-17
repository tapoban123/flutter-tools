import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/auto_route.gr.dart';
import 'package:auto_route_tutorial/widgets/home_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Home Screen"),
            HomeButton(
              backgroundColor: Colors.indigo,
              buttonText: "Click",
              onTap: () {
                context.router.push(OnBoardingScreen(name: "John Smith"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
