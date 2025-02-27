import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final String hintText;
//   final IconData prefixIcon;
//   final bool obscureText;
//   final TextInputType keyboardType;
//   final double? radius;
//
//   CustomTextField({
//     required this.hintText,
//     required this.prefixIcon,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.radius,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Material(
//       elevation: 4.0,
//       shadowColor: Colors.black.withOpacity(0.3),
//       borderRadius: BorderRadius.circular(screenWidth * 0.1),
//       child: TextField(
//         obscureText: obscureText,
//         keyboardType: keyboardType,
//         decoration: InputDecoration(
//           labelText: hintText,
//           prefixIcon: Icon(prefixIcon),
//           labelStyle: TextStyle(
//             height: 1.1,
//             color: Colors.grey,
//             fontWeight: FontWeight.normal,
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius??screenWidth * 0.1),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius??screenWidth * 0.1),
//           ),
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(radius??screenWidth * 0.1),
//           ),
//           contentPadding: EdgeInsets.symmetric(
//               horizontal: screenWidth * 0.05, vertical: screenWidth * 0.035),
//         ),
//       ),
//     );
//   }
// }

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final double? radius;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final Function(String? value)? validator;

  CustomTextField({
    required this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.radius,
    this.controller,
    this.suffixIcon,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Material(
      elevation: 4.0,
      shadowColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(screenWidth * 0.1),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: validator,
        decoration: InputDecoration(
          labelText: hintText,
          prefixIcon: prefixIcon,
          labelStyle: TextStyle(
            height: 1.1,
            color: Colors.grey,
            fontWeight: FontWeight.normal,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05, vertical: screenWidth * 0.035),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}


class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconPressed;
  final double? radius;

  CustomTextFormField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.radius,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: suffixIcon != null
            ? IconButton(
          icon: Icon(suffixIcon),
          onPressed: onSuffixIconPressed,
        )
            : null,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.1),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05, vertical: screenWidth * 0.035),
      ),
      validator: validator,
    );
  }
}