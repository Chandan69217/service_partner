import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color? foregroundColor;

  const CustomTextButton({Key? key, required this.label,this.onPressed,this.foregroundColor = Colors.black}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        foregroundColor: foregroundColor,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: screenWidth * 0.04,
          fontWeight: FontWeight.w400,
          color: foregroundColor
        ),
      ),
    );
  }
}
