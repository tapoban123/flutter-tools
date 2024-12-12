import 'package:chopper_tutorial/data/comments_data/comments_api_service.dart';
import 'package:chopper_tutorial/data/posts_data/post_api_service.dart';
import 'package:chopper_tutorial/pages/home_page.dart';
import 'package:chopper_tutorial/pages/view_comments_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PostApiService.create(),
          dispose: (context, value) => PostApiService.create().client.dispose(),
        ),
        Provider(
          create: (context) => CommentsApiService.create(),
          dispose: (context, value) =>
              CommentsApiService.create().client.dispose(),
        )
      ],
      builder: (_, child) => MaterialApp(
        title: "Chopper Tutorial",
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        home: const HomePage(),
      ),
    );
  }
}
