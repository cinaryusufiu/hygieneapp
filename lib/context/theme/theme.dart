import 'package:flutter/material.dart';

class FlutterTodosTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(62, 124, 197, 1),
      ),
      colorScheme: ColorScheme.fromSwatch(
        accentColor: const Color.fromRGBO(62, 124, 197, 1),
      ),
      scaffoldBackgroundColor: Colors.white,
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  static ThemeData get dark {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: Color.fromRGBO(62, 124, 197, 1),
      ),
      colorScheme: ColorScheme.fromSwatch(
        brightness: Brightness.dark,
        accentColor: const Color.fromRGBO(255, 21, 49, 7),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}
