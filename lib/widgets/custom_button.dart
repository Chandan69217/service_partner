import 'package:flutter/material.dart';
import '../utilities/cust_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color forgroundColor;
  final double elevation; // Added elevation property

  const CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = CustColors.yellow,
    this.forgroundColor = Colors.black,
    this.elevation = 4.0, // Default elevation
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Background color
          padding: EdgeInsets.symmetric(vertical: screenWidth * 0.035),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.013),
          ),
          elevation: elevation, // Set the elevation for the shadow effect
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            height: 1,
            fontWeight: FontWeight.w400,
            color: forgroundColor,
          ),
        ),
      ),
    );
  }
}
