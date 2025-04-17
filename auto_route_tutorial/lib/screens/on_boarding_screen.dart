import 'package:auto_route/auto_route.dart';
import 'package:auto_route_tutorial/auto_route.gr.dart';
import 'package:auto_route_tutorial/widgets/home_button.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OnBoardingScreen extends StatelessWidget {
  final String name;
  const OnBoardingScreen({super.key, required this.name});

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
              onTap: () {
                context.router.push(PaymentsScreen());
              },
            ),
            HomeButton(
              backgroundColor: Colors.indigo,
              buttonText: "Click",
              onTap: () {
                // Going back to previous route.
                // context.router.maybePop();

                // context.router.popUntil((route) => route is OnBoardingScreen);

                context.router.replace(HomeScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
