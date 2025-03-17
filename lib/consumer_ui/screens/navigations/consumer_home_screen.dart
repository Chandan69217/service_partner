import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utilities/cust_colors.dart';
import '../new_installation_req.dart';
import '../new_service_req_screen.dart';
import 'consumer_new_arrivals_screen.dart';

class ConsumerHomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
   return Scaffold(
     appBar: AppBar(
       backgroundColor: CustColors.yellow,
       automaticallyImplyLeading: false,
       title: Text('Dashboard'),
       // leading: Image.network(
       //   'https://storage.googleapis.com/a1aa/image/0-IwFsmX7Em0mr5yOL4vSi7OZSjngURqhMMlQ6mkBKs.jpg',
       //   height: 50,
       // ),
       actions: [
         IconButton(
             onPressed: () {},
             icon: Icon(FontAwesomeIcons.solidBell, size: 20,color: Colors.black,))
       ],
     ),
     body: SingleChildScrollView(
       child: Column(
         children: [
           Slider(),
           // Main Content Section
           Padding(
             padding: EdgeInsets.symmetric(
                 vertical: screenWidth * 0.06,
                 horizontal: screenWidth > 375
                     ? screenWidth * 0.02
                     : screenWidth * 0.1),
             child: GridView.count(
               shrinkWrap: true,
               crossAxisSpacing: screenWidth > 375 ? screenWidth * 0.03: screenWidth * 0.01,
               mainAxisSpacing: screenWidth > 375 ? screenWidth * 0.02: screenWidth * 0.01,
               crossAxisCount: 3,
               childAspectRatio: screenWidth > 375 ? 0.86 : 0.8,
               physics: NeverScrollableScrollPhysics(),
               children: [
                 CardWidget(
                   icon:
                   'https://storage.googleapis.com/a1aa/image/9V4ILaBWId5ilowokMfqa5pt4-k6QjbFP-9A0UKclNg.jpg',
                   title: 'Product Catalogue',
                   count: 372,
                 ),
                 CardWidget(
                   icon:
                   'https://storage.googleapis.com/a1aa/image/y32VAKSEmoyDpefPNqjrWeIrgHXJWRxkuhxpqppB2iM.jpg',
                   title: 'Service Request',
                   count: 0,
                 ),
                 CardWidget(
                   icon:
                   'https://storage.googleapis.com/a1aa/image/wH62GqlzE-2bRC9whzHFDIS-CXq94BENboTltNV07aM.jpg',
                   title: 'Installation Request',
                   count: 0,
                 ),
               ],
             ),
           ),

           // Buttons Section
           Padding(
             padding: EdgeInsets.symmetric(horizontal:  screenWidth * 0.02),
             child: GridView.count(
               shrinkWrap: true,
               crossAxisSpacing: screenWidth > 375 ? screenWidth * 0.03: screenWidth * 0.02,
               mainAxisSpacing:  screenWidth * 0.02,
               crossAxisCount: 2,
               childAspectRatio: 4,
               physics: NeverScrollableScrollPhysics(),
               children: [
                 ButtonWidget(
                   icon: FontAwesomeIcons.plus,
                   text: 'Add Service Req.',
                   onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewServiceReqScreen()));
                   },
                 ),
                 ButtonWidget(
                   icon: FontAwesomeIcons.cogs,
                   text: 'Add Installation Req.',
                   onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> NewInstallationReqScreen()));
                   },
                 ),
                 ButtonWidget(
                   icon: FontAwesomeIcons.headset,
                   text: 'Customer Care',
                   onPressed: () {
                     _launchDialer('+919876543210');
                   },
                 ),
                 ButtonWidget(
                   icon: FontAwesomeIcons.boxOpen,
                   text: 'New Arrivals',
                   onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ConsumerNewArrivalsScreen()));
                   },
                 ),
                 ButtonWidget(
                   icon: FontAwesomeIcons.mapMarkerAlt,
                   text: 'Nearest Plumbers',
                   onPressed: () {},
                 ),
               ],
             ),
           ),
           SizedBox(height: screenWidth * 0.05,)
         ],
       ),
     ),
   );
  }

  _launchDialer(String phoneNumber) async {
    final Uri dialUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(dialUri)) {
      await launchUrl(dialUri);
    } else {
      print( 'Could not launch $phoneNumber');
    }
  }
}

// Card Widget for displaying Product/Service info
class CardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final int count;

  const CardWidget({
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomPaint(
        painter: _MyCustomPainter(), // Use MyCustomPainter here
        child: Container(
          padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
          child: Column(
            children: [
              Image.network(
                icon,
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
              ),
              SizedBox(height: screenWidth * 0.01),
              Divider(),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.026,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // SizedBox(height: 5),
              Expanded(
                flex: 1,
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardWidget extends StatelessWidget {
  final String icon;
  final String title;
  final int count;

  const CustomCardWidget({
    required this.icon,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomPaint(
        painter: _MyCustomPainter(), // Using the custom painter
        child: Container(
          padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
          child: Column(
            children: [
              Image.network(
                icon,
                width: screenWidth * 0.12,
                height: screenWidth * 0.12,
              ),
              SizedBox(height: screenWidth * 0.01),
              Divider(),
              Expanded(
                flex: 2,
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: screenWidth * 0.028,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w500,
                    height: 1.1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    paint.color = Colors.red;
    paint.strokeWidth = 5;

    final rrect = RRect.fromRectAndRadius(
      Rect.fromPoints(Offset(size.width * 0.25, size.height),
          Offset(size.width * 0.75, size.height * 0.97)),
      Radius.circular(10),
    );
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false; // No repaint required
  }
}

// Button Widget
class ButtonWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  const ButtonWidget({
    required this.icon,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.blue,
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01, horizontal: screenWidth * 0.03),
        foregroundColor: Colors.white,
        iconColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        textStyle: TextStyle(
          fontSize: screenWidth * 0.03,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}


class Slider extends StatefulWidget {
  final VoidCallback? onPressed;

  const Slider({super.key, this.onPressed});
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> imageUrls = [
    'assets/retailer_assets/images/banner.webp',
    'assets/retailer_assets/images/bestsellersbanner.webp',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imageUrls.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: screenHeight * 0.28,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(screenWidth*0.015),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     offset: Offset(0, 4),
          //     blurRadius: 8,
          //   ),
          // ],
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.1),
                        // spreadRadius: 1,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    // borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      imageUrls[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
            // Indicator
            Positioned(
              bottom: (screenHeight * 0.3) * 0.05,
              child: Row(
                children: List.generate(imageUrls.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: (screenHeight * 0.23) * 0.041,
                    width: _currentPage == index
                        ? (screenHeight * 0.23) * 0.11
                        : (screenHeight * 0.23) * 0.041,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.white : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
