import 'package:childhood_illness_search_engine/core/theme/app_style.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData(
    fontFamily: "NunitoSans",
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: PrimaryColor.littleDarkBlue,
        fontSize: 25,
        fontWeight: FontWeight.w700,
      ),
      titleMedium: TextStyle(
        color: PrimaryColor.littleDarkBlue,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
  );
}
