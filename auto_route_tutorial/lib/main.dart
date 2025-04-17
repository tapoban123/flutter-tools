import 'package:auto_route_tutorial/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Auto Route Tutorial",
      theme: ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
