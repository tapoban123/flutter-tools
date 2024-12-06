import 'package:flutter/material.dart';
import 'package:freezed_package_tutorial/freezed/user.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var map = {
      "firstName": "John",
      "lastName": "Smith",
      "isActive": false,
    };

    var user = User.fromJson(map);

    print(user.toString());
    print(user.copyWith(firstName: "Joseph"));
    
    return Scaffold();
  }
}
