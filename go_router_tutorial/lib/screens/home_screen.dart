import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_tutorial/models/user_model.dart';
import 'package:go_router_tutorial/widgets/home_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeButton(
                backgroundColor: Colors.purple,
                buttonText: "Profile",
                onTap: () {
                  const UserModel userData = UserModel(
                    uid: "1",
                    name: "John Smith",
                    imgUrl:
                        "https://cdn4.vectorstock.com/i/1000x1000/76/73/cartoon-man-character-male-profile-image-vector-15327673.jpg",
                  );

                  // Passing values and pushing to a route that allows us to go back to previous route.
                  context.pushNamed("/profile", extra: userData);
                },
              ),
              HomeButton(
                backgroundColor: Colors.teal,
                buttonText: "Pricing",
                onTap: () {
                  context
                      .pushNamed("/pricing", pathParameters: {"price": "2000"});
                },
              ),
              HomeButton(
                backgroundColor: Colors.indigo,
                buttonText: "Dashboard",
                onTap: () {
                  context.pushNamed("/dashboard",
                      pathParameters: {"income": "10000"});
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
