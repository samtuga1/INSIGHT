import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme() {
    return ThemeData(
      primaryColor: const Color(0xff5669FF),
      textTheme: const TextTheme(
        button: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: Colors.white,
        ),
        headline1: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w600,
          fontSize: 24,
          color: Colors.black,
        ),
        bodyText1: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          fontFamily: 'Gilroy',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xff637381),
        ),
      ),
    );
  }
}
