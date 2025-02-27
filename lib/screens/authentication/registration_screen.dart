import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/otp_inputfield.dart';

class UserRegistrationScreen extends StatefulWidget {
  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _otpControllers = List.generate(6, (_) => TextEditingController());

  final _formKey = GlobalKey<FormState>();

  bool otpSent = false;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("User Registration"),
        backgroundColor: CustColors.yellow,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: screenHeight * 0.05),
                // Name Field

                CustomTextFormField(
                  controller: _nameController,
                  labelText: 'Full Name',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.02),

                CustomTextFormField(controller: _mobileController, labelText: 'Mobile Number',
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    return null;
                  },
                ),

                SizedBox(height: screenHeight * 0.02),

                // Email Field
                CustomTextFormField(
                  controller: _emailController,
                  labelText: 'Email Address',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email address';
                    }
                    final emailRegEx = RegExp(
                        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$");
                    if (!emailRegEx.hasMatch(value)) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Password Field
                CustomTextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  labelText: 'Password',
                  suffixIcon: _obscurePassword?Icons.visibility_off:Icons.visibility,
                  onSuffixIconPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.02),

                // Confirm Password Field
                CustomTextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscurePassword,
                  labelText: 'Confirm Password',
                  suffixIcon: _obscurePassword?Icons.visibility_off:Icons.visibility,
                  onSuffixIconPressed: (){
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: screenHeight * 0.05),

                if (!otpSent)
                  CustomElevatedButton(
                    text: 'Send OTP',
                    onPressed: () {
                      setState(() {
                        otpSent = true;
                      });
                      showOtpDialog(context, otpControllers: _otpControllers);
                    },
                  ),
                SizedBox(height: screenHeight * 0.02),

                // Submit Button
                CustomElevatedButton(
                  text: 'Register',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Submit registration logic here
                      print('Registration Successful');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


