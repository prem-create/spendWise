import 'package:flutter/material.dart';
import 'package:spend_wise/pages/home_page/home_page.dart';
import 'package:spend_wise/core/theme/my_theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: myThemeData,
      home: const HomePage(),
    );
  }
}
