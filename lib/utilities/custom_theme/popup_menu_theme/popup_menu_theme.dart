import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class TPopupMenuTheme{
  TPopupMenuTheme._();

  static final lightTheme = PopupMenuThemeData(
    iconColor: Colors.black,
      color: CustColors.white,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)),
  );

  static final darkTheme = PopupMenuThemeData(
      iconColor: CustColors.white,
    color: Colors.black,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18)),
  );

}