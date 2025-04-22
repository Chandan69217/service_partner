import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/cust_colors.dart';

class CustLoader extends StatelessWidget{
  final Color? color;
  CustLoader({this.color});
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: color??CustColors.primary,
      size: 25.0,
    );
  }

}