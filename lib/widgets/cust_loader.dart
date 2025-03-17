import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utilities/cust_colors.dart';

class CustLoader extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SpinKitThreeInOut(
      color: CustColors.primary,
      size: 25.0,
    );
  }

}