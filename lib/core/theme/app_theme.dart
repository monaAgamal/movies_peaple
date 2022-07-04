import 'package:flutter/material.dart';

class AppTheme {
  static get lightTheme => ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
        colorScheme: const ColorScheme(
          onError: Colors.white,
          onBackground: Colors.black,
          background: Colors.white,
          brightness: Brightness.light,
          error: Colors.red,
          surface: Colors.white,
          onSurface: Colors.black,
          onSecondary: Colors.white,
          onPrimary: Colors.black,
          primary: Colors.white,
          secondary: Colors.black,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.white,
        ),
      );

  static get darkTheme => ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.white,
        colorScheme: const ColorScheme(
          onError: Colors.white,
          onBackground: Colors.white,
          background: Colors.black,
          brightness: Brightness.dark,
          error: Colors.red,
          surface: Colors.black,
          onSurface: Colors.white,
          onSecondary: Colors.black,
          onPrimary: Colors.white,
          primary: Colors.black,
          secondary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.black,
        ),
      );
}
