import 'package:flutter/material.dart';

import '../../utilities/cust_colors.dart';

class NewInstallationReqScreen extends StatelessWidget {
  const NewInstallationReqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustColors.yellow,
        titleSpacing: 0,
        title: Text(
          'New Request',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BASIC INFORMATION',
              style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w500,
                  height: 1.1),
            ),
            SizedBox(height: screenHeight * 0.02),
            TextField(
              maxLines: 3,
              cursorColor: Colors.black,
              style: TextStyle(fontWeight: FontWeight.normal),
              decoration: InputDecoration(
                labelText: 'Remark',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle:
                TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                contentPadding: EdgeInsets.all(screenWidth * 0.03),
              ),
            ),
            // SizedBox(height: screenHeight * 0.02),
            // Text(
            //   'UPLOAD IMAGE OR VIDEO',
            //   style: TextStyle(
            //       fontSize: screenWidth * 0.04,
            //       fontWeight: FontWeight.w500,
            //       height: 1.1),
            // ),
            // SizedBox(height: screenHeight * 0.02),
            // GestureDetector(
            //   onTap: () {
            //     showModalBottomSheet(
            //         isScrollControlled: true,
            //         useSafeArea: true,
            //         backgroundColor: Colors.transparent,
            //         context: context,
            //         builder: (_) {
            //           return Container(
            //             width: screenWidth,
            //             padding:
            //             EdgeInsets.symmetric(vertical: screenWidth * 0.03),
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.only(
            //                   topLeft: Radius.circular(10.0),
            //                   topRight: Radius.circular(10.0)),
            //             ),
            //             child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: [
            //                 Text(
            //                   'Upload',
            //                   style: TextStyle(
            //                       fontSize: screenWidth * 0.041,
            //                       fontWeight: FontWeight.w600,height: 2.5),
            //                 ),
            //                 Divider(),
            //                 Padding(
            //                   padding: EdgeInsets.symmetric(horizontal: screenWidth > 375 ?screenWidth * 0.2:10),
            //                   child: Row(
            //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //                     children: [
            //                       TextButton.icon(
            //                         onPressed: () {},
            //                         style: TextButton.styleFrom(
            //                             iconSize: 30.0,
            //                             overlayColor: Colors.transparent,
            //                             foregroundColor: Colors.black,
            //                             textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: screenWidth * 0.04,color: Colors.black)
            //                         ),
            //                         label: Text(
            //                           'Image',
            //                         ),
            //
            //                         icon: Icon(
            //                           Icons.camera_alt,
            //                           color: Colors.brown,
            //                         ),
            //                       ),
            //                       SizedBox(width: screenWidth * 0.04,),
            //                       TextButton.icon(
            //                         onPressed: () {},
            //                         label: Text(
            //                           'Video',
            //                         ),
            //                         style: TextButton.styleFrom(
            //                             iconSize: 30.0,
            //                             overlayColor: Colors.transparent,
            //                             foregroundColor: Colors.black,
            //                             textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: screenWidth * 0.04,color: Colors.black)
            //                         ),
            //                         icon: Icon(
            //                           Icons.image,
            //                           color: CustColors.green,
            //                         ),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //                 SizedBox(height: 20,),
            //                 TextButton(onPressed: (){
            //                   Navigator.of(context).pop();
            //
            //                 }, child: Text('Cancel'),
            //                   style: TextButton.styleFrom(
            //                       iconSize: 30.0,
            //                       overlayColor: Colors.transparent,
            //                       foregroundColor: Colors.black,
            //                       textStyle: TextStyle(fontWeight: FontWeight.w400,fontSize: screenWidth * 0.04,color: Colors.black)
            //                   ),
            //                 )
            //               ],
            //             ),
            //           );
            //         });
            //   },
            //   child: Container(
            //     padding: EdgeInsets.all(screenWidth * 0.11),
            //     decoration: BoxDecoration(
            //       color: CustColors.nile_blue,
            //       borderRadius: BorderRadius.circular(10.0),
            //     ),
            //     child: Icon(
            //       Icons.camera_alt,
            //       size: 30.0,
            //       color: Colors.white,
            //     ),
            //   ),
            // ),
            SizedBox(height: screenHeight * 0.05),
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.055,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  backgroundColor: Color(0xFF28A745),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: (screenHeight * 0.055) * 0.3,
                      color: Colors.white,
                      height: 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
