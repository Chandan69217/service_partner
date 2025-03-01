import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_partner/screens/authentication/login_screen.dart';
import 'package:service_partner/utilities/cust_colors.dart';


// class WelcomeScreen extends StatefulWidget {
//   @override
//   State<WelcomeScreen> createState() => _WelcomeScreenState();
// }
//
// class _WelcomeScreenState extends State<WelcomeScreen> {
//   int _selectedButtonValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//           child: Center(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(height: screenHeight * 0.15,),
//                 Image.asset(
//                   'assets/logo/tools.webp',
//                   height: screenWidth * 0.3,
//                   width: screenWidth * 0.3,
//                 ),
//
//                 Padding(
//                   padding: EdgeInsets.only(top: screenWidth * 0.03),
//                   child: Text(
//                     'Welcome',
//                     style: TextStyle(
//                       fontSize: screenWidth * 0.1, // Responsive font size
//                       fontWeight: FontWeight.bold,
//                       height: 1.1
//                     ),
//                   ),
//                 ),
//
//                 RichText(
//                   textAlign: TextAlign.center,
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: 'PARTNER LOYALTY PROGRAM\n',
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.025,
//                           fontWeight: FontWeight.w600,
//                           height: 1.1,
//                           color: Colors.black,
//                         ),
//                       ),
//                       TextSpan(
//                         text: 'An Everlasting Bond',
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.025,
//                           fontWeight: FontWeight.w600,
//                           height: 1.5,
//                           color: Colors.redAccent,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Options (Electrical & Plumbing Expert / Retailer)
//                 Container(
//                   margin: EdgeInsets.only(top: screenWidth * 0.08),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       _OptionButton(
//                         onTap: (){
//                           setState(() {
//                             _selectedButtonValue = 0;
//                           });
//                         },
//                         isSelected: _selectedButtonValue == 0,
//                         icon:Icons.engineering,
//                         title: 'Electrical & Plumbing Expert',
//                       ),
//                       SizedBox(width: screenWidth * 0.1,),
//                       _OptionButton(
//                         onTap: (){
//                           setState(() {
//                             _selectedButtonValue = 1;
//                           });
//                         },
//                         isSelected: _selectedButtonValue == 1,
//                         icon: Icons.person,
//                         title: 'Retailer',
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Start Button
//                 Container(
//                   padding: EdgeInsets.only(top: screenWidth * 0.15),
//                   width: screenWidth*0.76,
//                   child: ElevatedButton.icon(
//                     iconAlignment: IconAlignment.end,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: CustColors.yellow,
//                       foregroundColor: Colors.black,
//                       iconColor: Colors.black,
//                       elevation: 2,
//                       padding: EdgeInsets.symmetric(vertical: screenWidth * 0.023,),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(screenWidth * 0.015),
//                       ),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LoginScreen()));
//                     },
//                     icon: Icon(Icons.start, size: screenWidth * 0.06),
//                     label: Text(
//                       'Start',
//                       style: TextStyle(
//                         fontSize: screenWidth * 0.04, // Responsive font size
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class _OptionButton extends StatelessWidget {
//   final IconData icon;
//   final String title;
//   final VoidCallback? onTap;
//   final  bool isSelected;
//
//   const _OptionButton({required this.icon, required this.title,this.isSelected=false,this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//        width: screenWidth * 0.26,
//         height: screenHeight * 0.25,
//         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01,vertical: screenWidth * 0.03),
//         decoration: BoxDecoration(
//           color: CustColors.yellow,
//           boxShadow: [BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 4,
//             spreadRadius: 3,
//             offset: Offset(0,1),
//           )],
//           borderRadius: BorderRadius.circular(screenWidth * 0.2),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//            Icon(
//               icon,
//               size: screenWidth * 0.13,
//              color: Colors.black,
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontWeight: FontWeight.w400,
//                 fontSize: screenWidth * 0.04,
//                 height: 1.1
//               ),
//               overflow: TextOverflow.ellipsis,
//               maxLines: 3,
//             ),
//             CircleAvatar(
//               backgroundColor: isSelected ? Colors.black:Colors.white,
//               radius: 14.0,
//               child: Icon(
//                 Icons.check,
//                 size: 16.0,
//                 color: isSelected ? Colors.white:Colors.black,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Map<int, String> _options = {
    0: 'Electrical & Plumbing Expert',
    1: 'Retailer',
  };

  int _selectedOptionKey = 0;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: screenHeight * 0.15),
                Image.asset(
                  'assets/logo/tools.webp',
                  height: screenWidth * 0.3,
                  width: screenWidth * 0.3,
                ),
                Padding(
                  padding: EdgeInsets.only(top: screenWidth * 0.03),
                  child: Text(
                    'Welcome',
                    style: TextStyle(
                      fontSize: screenWidth * 0.1, // Responsive font size
                      fontWeight: FontWeight.bold,
                      height: 1.1,
                    ),
                  ),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'PARTNER LOYALTY PROGRAM\n',
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w600,
                          height: 1.1,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'An Everlasting Bond',
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          fontWeight: FontWeight.w600,
                          height: 1.5,
                          color: Colors.redAccent,
                        ),
                      ),
                    ],
                  ),
                ),

                // Dropdown for selecting options (Electrical & Plumbing Expert / Retailer)
                Container(
                  margin: EdgeInsets.only(top: screenWidth * 0.08),
                  width: screenWidth * 0.76,
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.02,horizontal: screenWidth * 0.05),
                  decoration: BoxDecoration(
                    color: CustColors.yellow,
                    borderRadius: BorderRadius.circular(screenWidth * 0.1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 4,
                        spreadRadius: 3,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: DropdownButton<int>(
                    value: _selectedOptionKey,
                    isExpanded: true,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    iconSize: screenWidth * 0.08,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w400,
                    ),
                    underline: SizedBox(),  // To remove the underline
                    onChanged: (int? newKey) {
                      setState(() {
                        _selectedOptionKey = newKey!;
                      });
                    },
                    items: _options.entries.map<DropdownMenuItem<int>>((entry) {
                      return DropdownMenuItem<int>(
                        value: entry.key,
                        child: Text(entry.value),
                      );
                    }).toList(),
                  ),
                ),

                // Display the selected option
                SizedBox(
                  height: screenWidth * 0.2,
                  child: Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.05),
                    child: Text(
                      'You have selected: ${_options[_selectedOptionKey]}',
                      style: TextStyle(
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                // Start Button
                Container(
                  padding: EdgeInsets.only(top: screenWidth * 0.15),
                  width: screenWidth * 0.76,
                  child: ElevatedButton.icon(
                    iconAlignment: IconAlignment.end,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustColors.yellow,
                      foregroundColor: Colors.black,
                      iconColor: Colors.black,
                      elevation: 2,
                      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.023),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.015),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen(selectedOption: _selectedOptionKey,)));
                    },
                    icon: Icon(Icons.start, size: screenWidth * 0.06),
                    label: Text(
                      'Start',
                      style: TextStyle(
                        fontSize: screenWidth * 0.04, // Responsive font size
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

