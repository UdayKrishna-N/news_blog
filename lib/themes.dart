import 'package:flutter/material.dart';

class CustomThemes {
  static double defaultPadding = 16;

  final lightTheme = ThemeData(
    fontFamily: "Roboto",
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.grey[100],
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[100],
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.grey[900],
        size: 24,
      ),
      backgroundColor: Colors.grey[100],
      elevation: 2,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        letterSpacing: 2,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: Colors.black87,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
  );

  final darkTheme = ThemeData(
    fontFamily: "Roboto",
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
      bodySmall: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w600,
        letterSpacing: 0.5,
      ),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.grey[900],
    ),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.grey[100],
        size: 24,
      ),
      elevation: 2,
      backgroundColor: Colors.grey[900],
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        letterSpacing: 2,
      ),
    ),
  );
}
