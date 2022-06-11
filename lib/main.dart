import 'package:flutter/material.dart';
import 'package:pdp_ui_intro/pages/home_page.dart';
import 'package:pdp_ui_intro/pages/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
      routes: {
        HomePage.id: (context) => HomePage(),
        IntroPage.id: (context) => IntroPage(),
      },
    );
  }
}