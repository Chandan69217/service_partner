import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_aboutus_screen.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_contactus_screen.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_home_screen.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_new_arrivals_screen.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_profile_screen.dart';
import 'package:service_partner/utilities/cust_colors.dart';

class RetailerDashboard extends StatefulWidget {
  @override
  State<RetailerDashboard> createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends State<RetailerDashboard> {
  int _currentIndex = 0;
  final List<Widget> _screens = [RetailerHomeScreen(),
    RetailerNewArrivalsScreen(),
    RetailerContactusScreen(),
    RetailerAboutusScreen(),
    RetailerProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: _buildBottomNavigationBar(screenWidth),
    );
  }

  Widget _buildBottomNavigationBar(double screenWidth){
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        iconSize: screenWidth * 0.05,
        selectedFontSize: screenWidth* 0.03,
        unselectedFontSize: screenWidth* 0.03,
        selectedItemColor: CustColors.yellow,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        elevation: 30,
        items: [
          BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.home),
            label: 'Home',
          ),BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.gift),
            label: 'New Arrivals',
          ),BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.solidEnvelope),
            label: 'Contact Us',
          ),BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.infoCircle),
            label: 'About Us',
          ),BottomNavigationBarItem(
            icon:Icon( FontAwesomeIcons.solidUser),
            label: 'Profile',
          ),
        ]);
  }
}

