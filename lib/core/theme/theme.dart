import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    primaryColor: Color(0xFF1E3A8A),
    colorScheme: ColorScheme.dark(
      primary: Color(0xFF1E3A8A),
      secondary: Color(0xFF0D9488),
    ),
    scaffoldBackgroundColor: Color(0xFF121212),
  );
}

class Palette {
  static const Color error = Color(0xFFD84A49);
  static const Color warning = Color(0xFFEAB308);
  static const Color info = Color(0xFF6CB3C7);
  static const Color success = Color(0xFF5BC3A2);
}
