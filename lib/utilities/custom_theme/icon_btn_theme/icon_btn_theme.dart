import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';

class TIconBtnTheme{

  TIconBtnTheme._();

  static final IconButtonThemeData light = IconButtonThemeData(
      style: IconButton.styleFrom(
        iconSize: 20.0,
        overlayColor: CustColors.primary,
        foregroundColor: Colors.black.withValues(alpha: 0.5),
      )
  );

  static final IconButtonThemeData dark = IconButtonThemeData(
    style: IconButton.styleFrom(
        iconSize: 20.0,
      overlayColor: CustColors.primary,
      foregroundColor: Colors.white.withValues(alpha: 0.5),
    )
  );
}