import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: const Color(0xFFFBF5CA),
        secondary: Colors.black,
      ),
      scaffoldBackgroundColor: Colors.white,
    );
  }
}
