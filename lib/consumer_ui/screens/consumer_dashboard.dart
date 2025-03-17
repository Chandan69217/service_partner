import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'navigations/consumer_aboutus_screen.dart';
import 'navigations/consumer_contactus_screen.dart';
import 'navigations/consumer_home_screen.dart';
import 'navigations/consumer_new_arrivals_screen.dart';
import 'navigations/consumer_profile_screen.dart';

class ConsumerDashboard extends StatefulWidget {
  @override
  State<ConsumerDashboard> createState() => _ConsumerDashboardState();
}

class _ConsumerDashboardState extends State<ConsumerDashboard> {
  int _currentIndex = 0;
  final List<Widget> _screens = [ConsumerHomeScreen(),
    ConsumerNewArrivalsScreen(),
    ConsumerContactusScreen(),
    ConsumerAboutusScreen(),
    ConsumerProfileScreen()
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

