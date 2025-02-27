import 'package:flutter/material.dart';
import 'package:service_partner/screens/authentication/registration_screen.dart';
import 'package:service_partner/screens/scan_code_screen.dart';
import 'package:service_partner/widgets/custom_button.dart';
import '../../widgets/custom_textbutton.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/otp_inputfield.dart';
import 'forget_screen.dart';


class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = true;
  final List<TextEditingController> _otpControllers = List.generate(6, (_) => TextEditingController());

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double fontSize = screenWidth * 0.08;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: screenWidth * 0.1,),
                Image.asset(
                  'assets/logo/splash_logo.webp',
                  height: screenWidth * 0.25,
                  width: screenWidth * 0.25,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Service',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.blue,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                          height: 1.1
                        ),
                      ),
                      TextSpan(
                        text: ' Partner',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontSize: fontSize,
                          fontWeight: FontWeight.normal,
                          height: 1.1
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'PARTNER LOYALTY PROGRAM',
                  style: TextStyle(
                    fontSize: fontSize * 0.4,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: screenHeight * 0.03),
                Text(
                  'Login',
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Login or register to continue',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: fontSize * 0.4,
                  ),
                ),

                // Input fields
                SizedBox(height: screenHeight * 0.04),
                CustomTextField(hintText: 'Registered Mobile No', prefixIcon: Icon(Icons.phone)),
                SizedBox(height: screenHeight * 0.02),
                CustomTextField(hintText: 'Password', prefixIcon: Icon(Icons.lock)),

                // Buttons
                SizedBox(height: screenWidth * 0.09),

                // update kyc & Forget button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: CustomElevatedButton(elevation: 0,text: 'UPDATE KYC', onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ScanCodeScreen()));
                    })),
                    Expanded(
                      child: CustomTextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ForgetPasswordScreen()),
                          );
                        },
                        foregroundColor: Colors.grey,
                        label: 'Forgot Password?',
                      ),
                    ),

                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                CustomElevatedButton(text: 'Log In', onPressed: (){}),
                SizedBox(height: screenHeight * 0.02),
                CustomElevatedButton(text: 'Log In with OTP', onPressed: (){
                  showOtpDialog(context,otpControllers: _otpControllers);
                }),
                SizedBox(height: screenHeight * 0.02),
                CustomElevatedButton(text: 'New User Registration', onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
                  );
                },forgroundColor: Colors.white,backgroundColor: Colors.black,),


                SizedBox(height: screenHeight * 0.02),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.black,
                      value: isChecked,
                      onChanged: (_) {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'I have read & fully understood the terms and conditions of V-Guard Rishta Loyalty Program and abide to follow them.',
                        style: TextStyle(color: Colors.grey, fontSize: screenWidth * 0.03),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

}




