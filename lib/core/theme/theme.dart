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

  static const Map<String, Map<int, Color>> docflow = {
    'purple': {
      100: Color(0xFFEAE6FF),
      200: Color(0xFFD5CCFF),
      300: Color(0xFFB9A8FF),
      400: Color(0xFFA594FF),
      500: Color(0xFF8C78FF),
      600: Color(0xFF7B63FF),
      700: Color(0xFF6A4FF5),
      800: Color(0xFF553AE0),
      900: Color(0xFF4429C6),
    },
    'blue': {
      100: Color(0xFFE6F8FF),
      200: Color(0xFFC7EEFF),
      300: Color(0xFF94DFFF),
      400: Color(0xFF62CFFF),
      500: Color(0xFF3BBCFF),
      600: Color(0xFF19A1F0),
      700: Color(0xFF0D8AD6),
      800: Color(0xFF0670B3),
      900: Color(0xFF025A94),
    },
    'dark': {
      100: Color(0xFF4A4B55),
      200: Color(0xFF3D3E48),
      300: Color(0xFF303138),
      400: Color(0xFF26272D),
      500: Color(0xFF1D1E22),
      600: Color(0xFF18191D),
      700: Color(0xFF131418),
      800: Color(0xFF0E0F13),
      900: Color(0xFF0A0A0D),
    },
  };
}
