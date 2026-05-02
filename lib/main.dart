import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:spend_wise/core/theme/my_theme_data.dart';
import 'package:spend_wise/firebase_options.dart';
import 'package:spend_wise/pages/auth_pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Wise',
      debugShowCheckedModeBanner: false,
      theme: myThemeData,
      home: LoginScreen(),
    );
  }
}
