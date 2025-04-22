import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/utilities/custom_theme/text_theme/text_theme.dart';


class TListTileTheme {
  TListTileTheme._();

  static final ListTileThemeData light  = ListTileThemeData(
      titleTextStyle: TTextTheme.lightTextTheme.bodyMedium,
      subtitleTextStyle: TTextTheme.lightTextTheme.bodySmall,
      selectedColor: Colors.black,
      selectedTileColor: CustColors.primary
  );

  static final ListTileThemeData dark = ListTileThemeData(
    titleTextStyle: TTextTheme.darkTextTheme.bodyMedium,
    subtitleTextStyle: TTextTheme.darkTextTheme.bodySmall,
    selectedTileColor: Colors.grey,
    selectedColor: CustColors.white,
  );
}