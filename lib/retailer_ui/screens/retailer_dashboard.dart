import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_home_screen.dart';
import 'package:service_partner/retailer_ui/screens/navigations/retailer_helpline_screen.dart';
import 'package:service_partner/screens/authentication/login_screen.dart';
import 'package:service_partner/screens/splash/splash_screen.dart';
import 'package:service_partner/utilities/cust_colors.dart';

class RetailerDashboard extends StatefulWidget {
  @override
  State<RetailerDashboard> createState() => _RetailerDashboardState();
}

class _RetailerDashboardState extends State<RetailerDashboard> {
  int _currentIndex = 0;
  List<String> _title = ['Home','My Earnings','My Redemption','Support'];
  List<Widget> _screens = [RetailerHomeScreen(),RetailerHomeScreen(),RetailerHomeScreen(),HelplineScreen(),];
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: CustColors.nile_blue,
        titleSpacing: 0,
        title: Text(
          _title[_currentIndex],
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: InkWell(
              radius: 50.0,
              borderRadius: BorderRadius.circular(50.0),
              splashColor: Colors.black12,
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Badge(
                  label: Text('1'),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.white,
                      size: screenWidth * 0.054,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: _screens[_currentIndex],
      drawer: _drawerUI(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          backgroundColor: CustColors.nile_blue,
          iconSize: screenWidth * 0.055,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          unselectedFontSize: screenWidth * 0.03,
          selectedFontSize: screenWidth * 0.03,
          onTap: (selectedIndex){
          setState(() {
            _currentIndex = selectedIndex;
          });
          },
          items: [
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Icon(FontAwesomeIcons.home,),
            ),label: 'Home',),
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Icon(FontAwesomeIcons.wallet,),
            ),label: 'My Earnings'),
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(bottom: 2.0),
              child: Icon(FontAwesomeIcons.receipt,),
            ),label: 'My Redemption'),
            BottomNavigationBarItem(icon: Padding(
              padding: const EdgeInsets.only(bottom:0),
              child: Icon(FontAwesomeIcons.handshake,),
            ),label: 'Support'),
          ]
      ),
    );
  }

  Widget _drawerUI() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Drawer(
      width: screenWidth * 0.8,
      child: Column(
        children: [
          _buildHeader(screenWidth, screenHeight),
          _buildMenuList(screenWidth * 0.8),
        ],
      ),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: (screenWidth * 0.8) * 0.06),
      decoration: BoxDecoration(
        color: Color(0xFF003366),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: (screenWidth * 0.8)*0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Text('Member Since: Jul 2020',
                         style: TextStyle(color: Colors.white, fontSize: (screenWidth * 0.8)*0.04)),
                     Text('Version v 1.1.1',
                         style: TextStyle(color: Colors.white, fontSize: (screenWidth * 0.8)*0.04)),
                   ],
                 ),
                 Spacer(),
                 IconButton(color: Colors.redAccent,onPressed: ()async{
                   await Pref.instance.clear();
                   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=> LoginScreen()), (route)=> false);
                 }, icon: Icon(Icons.power_settings_new_rounded),)
               ],
             ),
              SizedBox(height: screenHeight * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: screenWidth * 0.09,
                    backgroundImage: NetworkImage(
                      'https://storage.googleapis.com/a1aa/image/1Nw9AKnYhYQN0r9c84ds1zLvkMHs0g8WcmmxtFI8eXw.jpg',
                    ),
                  ),
                  SizedBox(width: (screenWidth * 0.8) * 0.04),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Saurabh Singh',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: (screenWidth * 0.8)*0.05)),
                        Text('Membership ID: xxxxxxxxxx',
                            style: TextStyle(color: Colors.white, fontSize:(screenWidth * 0.8)*0.04 )),
                        Text('Total Points: XXXXXX',
                            style: TextStyle(color: Colors.white, fontSize: (screenWidth * 0.8)*0.04)),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuList(double screenWidth) {
    final List<Map<String, dynamic>> menuItems = [
      {'icon': FontAwesomeIcons.solidCircleUser, 'label': 'Profile'},
      {'icon': FontAwesomeIcons.handHoldingUsd, 'label': 'Claim Points'},
      {'icon': FontAwesomeIcons.clipboardCheck, 'label': 'Claim Status'},
      {'icon': FontAwesomeIcons.wallet, 'label': 'My Earnings'},
      {'icon': FontAwesomeIcons.bullhorn, 'label': 'My Promotions'},
      {'icon': FontAwesomeIcons.shoppingCart, 'label': 'Redemption Catalogue'},
      {'icon': FontAwesomeIcons.gift, 'label': 'My Redemption'},
      {'icon': FontAwesomeIcons.heart, 'label': 'Wishlist'},
      {'icon': FontAwesomeIcons.gift, 'label': 'Dream Gift'},
      {'icon': FontAwesomeIcons.questionCircle, 'label': 'Lodge Query'},
      {'icon': FontAwesomeIcons.circleInfo, 'label': 'Helpline'},
    ];
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.zero,
        itemCount: menuItems.length,
        separatorBuilder: (_, __) => Divider(color: Colors.grey[300], height: 1),
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            minLeadingWidth: 0,
            leading: Icon(menuItems[index]['icon'], color: Colors.black54,size: screenWidth * 0.07,),
            title: Text(menuItems[index]['label'],
                style: TextStyle(fontSize: screenWidth*0.05, fontWeight: FontWeight.w500)),
            onTap: () {},
          );
        },
      ),
    );
  }


}
