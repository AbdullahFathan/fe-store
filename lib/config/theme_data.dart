import 'package:flutter/material.dart';

const smokeWhiteColor = Color(0xfff3f3f3);
const raisinBlackColor = Color(0xff262729);
const brownColor = Color(0xffB29F89);

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: smokeWhiteColor,
  fontFamily: 'Nunito',
  textTheme: const TextTheme(
    titleLarge: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    labelMedium: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    labelSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w700,
    ),
    bodySmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: brownColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    ),
    bodyLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w700,
    ),
  ),
);
