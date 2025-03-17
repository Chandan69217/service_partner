import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:service_partner/retailer_ui/screens/retailer_dashboard.dart';
import 'package:service_partner/screens/authentication/welcome_screen.dart';
import 'package:service_partner/utilities/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utilities/cust_colors.dart';
import '../authentication/login_screen.dart';

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
            Image.asset('assets/logo/krishco-logo-bg.webp',width: screenWidth * 0.9,),
            // RichText(
            //   text: TextSpan(
            //     children: [
            //       TextSpan(
            //         text: 'Service',
            //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //           color: Colors.blue,
            //           fontSize: fontSize,
            //           fontWeight: FontWeight.normal,
            //         ),
            //       ),
            //       TextSpan(
            //         text: ' Partner',
            //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            //           color: Colors.black,
            //           fontSize: fontSize,
            //           fontWeight: FontWeight.normal,
            //         ),
            //       ),
            //     ],
            //   ),
            // )

          ],
        ),
      ),
    );
  }

  futureCall(BuildContext context)async{
    WidgetsBinding.instance.addPostFrameCallback((duration)async{
      Pref.instance = await SharedPreferences.getInstance();
      bool isLogin = await Pref.instance.getBool(Consts.isLogin)??false;
      Future.delayed(Duration(seconds: 1),()=> Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>isLogin ? RetailerDashboard():LoginScreen())));
    });
  }

}

class Pref{
  static late SharedPreferences instance;
}

