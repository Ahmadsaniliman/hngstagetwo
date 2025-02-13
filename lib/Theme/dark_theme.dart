import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  primaryColor: Colors.blue[200],
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF121212),
    elevation: 0,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.blue[200]),
    bodyLarge: const TextStyle(color: Colors.white70),
    bodyMedium: const TextStyle(color: Colors.white54),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[900],
  ),
);
