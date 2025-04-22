import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class TBottomNavigationBarTheme{
  TBottomNavigationBarTheme._();

  static final BottomNavigationBarThemeData light = BottomNavigationBarThemeData(
      // selectedItemColor: CustColors.,
      // unselectedItemColor: ColorTheme.BLACK,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: CustColors.white,
      selectedLabelStyle:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
  );

  static final BottomNavigationBarThemeData dark = BottomNavigationBarThemeData(
      // selectedItemColor: CustColors.RED,
      // unselectedItemColor: ColorTheme.BLACK,
      showUnselectedLabels: true,
      backgroundColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)
  );
}

class TNavigationBarTheme{
  TNavigationBarTheme._();

  static final NavigationBarThemeData light = NavigationBarThemeData(
    backgroundColor: CustColors.white,
  );

  static final NavigationBarThemeData dart = NavigationBarThemeData(
    backgroundColor: Colors.black
  );
}