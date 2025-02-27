import 'package:flutter/material.dart';

ThemeData themeData(BuildContext context){
  final text_scale_factor = MediaQuery.of(context).textScaleFactor;
  return ThemeData(
    useMaterial3: true,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 18.0*text_scale_factor,
        fontWeight: FontWeight.bold,
      ),
            bodyMedium: TextStyle(
              fontSize: 14.0*text_scale_factor,
            ),
        bodySmall: TextStyle(
          fontSize: 12.0*text_scale_factor,
        )
    )
  );
}