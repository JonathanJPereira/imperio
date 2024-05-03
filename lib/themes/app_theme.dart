import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: const Color(0xFFFBF5CA),
          secondary: const Color(0xFFF5D70A),
          tertiary: Colors.black),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
