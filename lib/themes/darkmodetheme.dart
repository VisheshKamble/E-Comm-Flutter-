import 'package:flutter/material.dart';

final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
    background: Colors.grey[900]!,
    surface: Colors.grey[800]!,
    primary: Colors.blue[300]!,
    secondary: Colors.blue[700]!,
    onBackground: Colors.white,
    onSurface: Colors.white,
    inversePrimary: Colors.blue[100]!,
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyMedium: TextStyle(fontSize: 16),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  ),
);