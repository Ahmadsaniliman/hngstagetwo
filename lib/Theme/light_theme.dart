import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: Colors.blue[900],
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  textTheme: TextTheme(
    titleLarge: TextStyle(color: Colors.blue[900]),
    bodyLarge: const TextStyle(color: Colors.black87),
    bodyMedium: const TextStyle(color: Colors.black54),
  ),
  inputDecorationTheme: InputDecorationTheme(
    fillColor: Colors.grey[100],
  ),
);
