import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFFFBF5CA);
  static const secondaryColor = Color(0xFFF5D70A);
  static const tertiaryColor = Colors.black;
  static const secondaryContainerColor = Color(0xFFF2ECCB);

  static ThemeData get lightTheme {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        color: primaryColor,
      ),
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme.fromSwatch().copyWith(
        surfaceTint: Colors.white,
        primary: primaryColor,
        secondary: secondaryColor,
        tertiary: tertiaryColor,
        secondaryContainer: secondaryContainerColor,
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: const TextTheme(
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(secondaryColor),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
          ),
        ),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
        shadowColor: Colors.black26,
      ),
      iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(1.0),
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return primaryColor;
              return null;
            },
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return primaryColor;
              return null;
            },
          ),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shadowColor: MaterialStateProperty.all(Colors.black),
          elevation: MaterialStateProperty.all(1.0),
        ),
      ),
      dividerTheme: const DividerThemeData(color: Color(0xFFEFEFEF)),
    );
  }
}
