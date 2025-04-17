import 'package:auto_route/annotations.dart';
import 'package:auto_route_tutorial/widgets/home_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Onboarding Screen")),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Onboarding Screen"),
            HomeButton(
              backgroundColor: Colors.amber,
              buttonText: "Click",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
