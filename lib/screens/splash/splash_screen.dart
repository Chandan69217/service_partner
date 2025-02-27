import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_partner/screens/authentication/welcome_screen.dart';
import '../../utilities/cust_colors.dart';

class SplashScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double fontSize = screenWidth * 0.08;
    futureCall(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/logo/splash_logo.webp'),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Service',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.blue,
                      fontSize: fontSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  TextSpan(
                    text: ' Partner',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.black,
                      fontSize: fontSize,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

  futureCall(BuildContext context){
    Future.delayed(Duration(seconds: 1),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>WelcomeScreen())));
  }

}

