import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light(
        primary: Color(0XFF37105E),
        surface: Color(0xFFF7F9FB),
        onSurface: Color(0xFF1A1C1E),
        surfaceContainerHighest: Colors.white,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: Color(0xFF9B6BFF),
        surface: Color(0xFF0C1324),
        onSurface: Colors.white,
        surfaceContainerHighest: Color(0xFF2A3043),
      ),
    );
  }
}
