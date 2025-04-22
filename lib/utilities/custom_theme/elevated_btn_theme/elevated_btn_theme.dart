import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/utilities/custom_theme/text_theme/text_theme.dart';


class ElevatedBtnTheme {
  ElevatedBtnTheme._();

  static final ElevatedButtonThemeData light =
      ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 16),
        textStyle: TTextTheme.lightTextTheme.bodyMedium,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 2,
        iconColor: CustColors.white,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: CustColors.white,
      ));

  static final ElevatedButtonThemeData dark = ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 16),
    textStyle: TTextTheme.lightTextTheme.bodyMedium,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    elevation: 2,
    iconColor: CustColors.white,
    backgroundColor: Colors.deepPurpleAccent,
    foregroundColor: CustColors.white,
  ));
}
