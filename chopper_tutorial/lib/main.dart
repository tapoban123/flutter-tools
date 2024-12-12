import 'package:chopper_tutorial/data/post_api_service.dart';
import 'package:chopper_tutorial/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PostApiService.create(),
      dispose: (_, PostApiService service) => service.client.dispose(),
      builder: (_, child) => MaterialApp(
        title: "Chopper Tutorial",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}
