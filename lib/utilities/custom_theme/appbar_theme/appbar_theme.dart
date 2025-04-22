import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';

class TAppbarTheme{
  TAppbarTheme._();

  static final AppBarTheme lightAppbarTheme = AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: CustColors.nile_blue,
      iconTheme: IconThemeData(
          color: Colors.black
      )
  );

  static final AppBarTheme darkAppbarTheme = AppBarTheme(
      backgroundColor: Colors.black,
    iconTheme: IconThemeData(
      color: CustColors.white
    )
  );
}