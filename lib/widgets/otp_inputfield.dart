import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_button.dart';
import 'custom_textbutton.dart';

void showOtpDialog(BuildContext context,{required List<TextEditingController> otpControllers}) {
  double screenWidth = MediaQuery.of(context).size.width;
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter OTP'),
        content: SizedBox(
          height: 200,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildOtpFields(context,otpControllers: otpControllers),
              SizedBox(height: screenWidth > 375 ? MediaQuery.of(context).size.width * 0.1:screenWidth * 0.009),
              CustomElevatedButton(
                text: 'Submit',
                elevation: 1,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

Widget _buildOtpFields(BuildContext context,{required List<TextEditingController> otpControllers}) {
  double screenWidth = MediaQuery.of(context).size.width;
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(6, (index) {
          return SizedBox(
            width: screenWidth>375?screenWidth * 0.1:screenWidth * 0.09,
            height: screenWidth > 375 ? 55 : 40,
            child: TextField(
              controller: otpControllers[index],
              decoration: InputDecoration(
                counterText: '',
                hintText: '-',
                hintStyle: TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.transparent,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(color: Colors.grey),
                ),
              ),
              keyboardType: TextInputType.number,
              maxLength: 1,
              textAlign: TextAlign.center,
              onChanged: (value) {
                if (value.isNotEmpty && index < 5) {
                  FocusScope.of(context).nextFocus();
                } else if (value.isEmpty && index > 0) {
                  FocusScope.of(context).previousFocus();
                }
              },
            ),
          );
        }),
      ),
      // SizedBox(height: screenWidth * 0.00),
      CustomTextButton(
        label: 'Resend OTP',
        foregroundColor: Colors.grey,
        onPressed: () {
          // Resend OTP logic can be added here
          print("Resend OTP pressed");
        },
      ),
    ],
  );
}