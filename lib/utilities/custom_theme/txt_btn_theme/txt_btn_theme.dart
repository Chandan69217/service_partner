import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';



class TTextButtonTheme{

  TTextButtonTheme._();

  static final TextButtonThemeData ligth = TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor:  CustColors.primary,
        iconColor: Colors.black,
        shape: const RoundedRectangleBorder(),
        foregroundColor: Colors.black,
      )
  );

  static final TextButtonThemeData dark = TextButtonThemeData(
      style: TextButton.styleFrom(
        overlayColor: Colors.grey,
        iconColor:  CustColors.white,
        shape: const RoundedRectangleBorder(),
        foregroundColor:  CustColors.white,
      )
  );
}