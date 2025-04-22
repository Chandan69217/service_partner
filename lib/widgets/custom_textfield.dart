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

class CustomFormTextField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType keyboardType;
  final double? radius;
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final bool isborder;
  final String? label;
  final int? maxLength;
  final Key? key;
  final String? Function(String? value)? validator;

  CustomFormTextField({
    this.hintText,
    this.labelText,
    this.label,
    this.prefixIcon,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.radius,
    this.controller,
    this.suffixIcon,
    this.validator,
    this.maxLength,
    this.key,
    this.isborder = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(label != null) Text(label!,style: TextStyle(height: 2),),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          validator: validator,
          maxLength: maxLength,
          cursorColor: Colors.black,
          style: TextStyle(
            fontSize: screenWidth * 0.04,
            fontWeight: FontWeight.normal
          ),
          decoration: InputDecoration(
            labelText: hintText,
            hintText: labelText,
            counterText: '',
            errorStyle: TextStyle(
                fontSize: screenWidth * 0.03,
                fontWeight: FontWeight.normal
            ),
            prefixIcon: prefixIcon,
            labelStyle: TextStyle(
              height: 1.1,
              color: Colors.grey,
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.normal,
            ),
            focusedBorder: isborder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.013),
            ): null,
            enabledBorder: isborder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.013),
            ) : null,
            border: isborder ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius ?? screenWidth * 0.013),
            ): InputBorder.none,
            contentPadding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.028, ),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}

