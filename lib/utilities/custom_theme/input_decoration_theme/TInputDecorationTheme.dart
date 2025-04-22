import 'package:flutter/material.dart';
import 'package:service_partner/utilities/custom_theme/text_theme/text_theme.dart';

class TInputDecorationTheme{
  TInputDecorationTheme._();

  static InputDecorationTheme light =  InputDecorationTheme(
    labelStyle: TTextTheme.lightTextTheme.bodySmall!.copyWith(
      color: Colors.black54,
    ),
    filled: true,
    fillColor:  Colors.grey[100],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.purple,
            width: 1.2
        )),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color:  Colors.grey[300]!,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );

  static InputDecorationTheme dark = InputDecorationTheme(
    labelStyle: TTextTheme.darkTextTheme.bodySmall!.copyWith(
      color:  Colors.white70,
    ),
    filled: true,
    fillColor: Colors.grey[850],
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Colors.purple,
            width: 1.2
        )),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[700]!,
      ),
      borderRadius: BorderRadius.circular(8),
    ),
  );
}