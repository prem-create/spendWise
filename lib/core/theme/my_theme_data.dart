import 'package:flutter/material.dart';

ThemeData myThemeData = ThemeData(
  colorScheme: .fromSeed(
    seedColor: Color(0xFF25D1F4),
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    titleSmall: TextStyle(fontSize: 14),
  ),
  useMaterial3: true,
);
