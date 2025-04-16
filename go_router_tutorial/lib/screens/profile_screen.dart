import 'package:flutter/material.dart';
import 'package:go_router_tutorial/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel userData;
  const ProfileScreen({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(userData.imgUrl),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "User ID: ${userData.uid}",
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              "Name: ${userData.name}",
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
