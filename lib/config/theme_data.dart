import 'package:flutter/material.dart';

const smokeWhiteColor = Color(0xfff3f3f3);

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: smokeWhiteColor,
  fontFamily: 'Nunito',
  textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
      )),
);
