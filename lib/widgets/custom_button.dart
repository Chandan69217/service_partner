import 'package:flutter/material.dart';
import '../utilities/cust_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color forgroundColor;
  final double? width;
  final double elevation; // Added elevation property

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = CustColors.nile_blue,
    this.forgroundColor = Colors.white,
    this.elevation = 4.0,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = width??MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      // height: screenWidth * 0.3,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.035),
          ),
          elevation: elevation,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: width!=null ? width!*0.1:screenWidth * 0.04,
            height: 1,
            fontWeight: FontWeight.w400,
            color: forgroundColor,
          ),
        ),
      ),
    );
  }
}
