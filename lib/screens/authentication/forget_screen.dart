import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/widgets/custom_textbutton.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';


// class ForgetPasswordScreen extends StatelessWidget {
//   final TextEditingController _otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Forget Password'),
//         backgroundColor: CustColors.yellow,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(height: screenHeight * 0.2),
//               Text(
//                 'Reset Your Password',
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.07,
//                   fontWeight: FontWeight.bold,
//                   height: 1,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.005),
//               Text(
//                 'Enter your registered email or mobile number to receive OTP.',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   height: 1,
//                   color: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.05),
//
//               CustomTextField(
//                 hintText: 'Email or Mobile Number',
//                 prefixIcon: Icons.email,
//                 keyboardType: TextInputType.emailAddress,
//               ),
//               SizedBox(height: screenHeight * 0.05),
//
//               _buildOtpFields(context),
//
//               SizedBox(height: screenHeight * 0.05),
//
//               // Reset Password Button
//               CustomElevatedButton(
//                 text: 'Reset Password',
//                 onPressed: () {
//                   // Add your reset password logic here
//                 },
//               ),
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: CustomTextButton(
//                   label: 'New User Registration',
//                   foregroundColor: Colors.grey,
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               // Back to Login Button
//               CustomTextButton(
//                 label: 'Back to Login',
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOtpFields(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(6, (index) {
//         return SizedBox(
//           width: screenWidth * 0.12,  // You can adjust the width as needed
//           child: TextField(
//             controller: _otpController,
//             decoration: InputDecoration(
//               counterText: '',
//               hintText: '-',
//               hintStyle: TextStyle(color: Colors.grey),
//               filled: true,
//               fillColor: Colors.white,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey),
//               ),
//             ),
//             keyboardType: TextInputType.number,
//             maxLength: 1,
//             textAlign: TextAlign.center,
//             onChanged: (value) {
//               if (value.length == 1 && index < 5) {
//                 FocusScope.of(context).nextFocus();
//               }
//             },
//           ),
//         );
//       }),
//     );
//   }
// }


class ForgetPasswordScreen extends StatelessWidget {
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        foregroundColor: CustColors.white,
        titleSpacing: 0,
        title: Text('Forget Password',style: TextStyle(fontSize: screenWidth * 0.05),),
        backgroundColor: CustColors.nile_blue,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: screenHeight * 0.1),
              Text(
                'Reset Your Password',
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Text(
                'Enter your registered email or mobile number to receive OTP.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),

              CustomFormTextField(
                hintText: 'Email or Mobile Number',
                prefixIcon: Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: screenHeight * 0.05),

              _buildOtpFields(context),
              SizedBox(height: screenHeight * 0.05),

              CustomElevatedButton(
                text: 'Reset Password',
                onPressed: () {

                },
              ),
              // SizedBox(height: 4.0,),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: CustomTextButton(
              //     label: 'New User Registration',
              //     foregroundColor: Colors.grey,
              //   ),
              // ),
              SizedBox(height: screenHeight * 0.07),

              CustomTextButton(
                label: 'Back to Login',
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpFields(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(6, (index) {
            return SizedBox(
              width: screenWidth * 0.12,
              child: TextField(
                controller: _otpControllers[index],
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
        SizedBox(height: 10.0,),
        CustomTextButton(label: 'Resend OTP',foregroundColor: Colors.grey,)
      ],
    );
  }
}
