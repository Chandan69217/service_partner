import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class TTextTheme {
  TTextTheme._();

  static const TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color: Colors.black,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  );

  static const TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      color: CustColors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color:  CustColors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    headlineSmall: TextStyle(
      color:  CustColors.white,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      color:  CustColors.white,
      fontSize: 18,
    ),
    bodyMedium: TextStyle(
      color:  CustColors.white,
      fontSize: 16,
    ),
    bodySmall: TextStyle(
      color:  CustColors.white,
      fontSize: 14,
    ),
    titleLarge: TextStyle(
      color:  CustColors.white,
      fontSize: 12,
      fontWeight: FontWeight.bold,
    ),
    titleMedium: TextStyle(
      color:  CustColors.white,
      fontSize: 11,
      fontWeight: FontWeight.bold,
    ),
    titleSmall: TextStyle(
      color:  CustColors.white,
      fontSize: 10,
      fontWeight: FontWeight.bold,
    ),
  );
}
