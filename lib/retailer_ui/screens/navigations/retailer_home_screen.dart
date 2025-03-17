import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_partner/retailer_ui/screens/retailer_claim_point_screen.dart';
import 'package:service_partner/retailer_ui/screens/retailer_redemption_screen.dart';

import '../../../utilities/cust_colors.dart';

class RetailerHomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // top card design
            SizedBox(
              height: screenHeight * 0.28,
              child: Stack(alignment: Alignment.topCenter, children: [
                Image.network(
                  'https://img.freepik.com/free-photo/standard-quality-control-concept-m_23-2150041853.jpg?t=st=1741258764~exp=1741262364~hmac=a53b623aad7f10d6c31f3dc6de6bfc61aed1ffeb7bbb0611c87bc992fe8cc06d&w=1800',
                  width: screenWidth,
                  height: screenHeight * 0.25,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: (screenHeight * 0.3) * 0.02,
                  right: (screenHeight * 0.3) * 0.2,
                  left: (screenHeight * 0.3) * 0.2,
                  child: _buildContainer(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/retailer_assets/icons/ticket_sharp_icon.webp',
                          color: Colors.white,
                          width: (screenHeight * 0.3) * 0.1,
                          height: (screenHeight * 0.3) * 0.1,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: (screenHeight * 0.3) * 0.02),
                        Text('Total Points: xxxx',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: (screenHeight * 0.3) * 0.07)),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),

            // Card & menu Design
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  _buildContainer(
                    padding: EdgeInsets.only(top: screenWidth * 0.03),
                    width: screenWidth,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.05),
                                children: [
                                  TextSpan(
                                    text: 'Member Name: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'xxxxxxx',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                children: [
                                  TextSpan(
                                    text: 'Membership ID: ',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: 'xxxxxxxxxxxx',
                                    style: TextStyle(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Divider(
                          height: 0,
                          thickness: 1,
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: screenWidth * 0.04,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Beneficiary Type\n',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(
                                        text: 'Plumber',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 1,
                                height: screenWidth * 0.2,
                                color: Colors.white,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                              ),
                              Expanded(
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: screenWidth * 0.04),
                                    children: [
                                      TextSpan(
                                        text: 'Tier\n',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal),
                                      ),
                                      TextSpan(
                                        text: 'Silver',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            height: 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // menu items

                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    shrinkWrap: true,
                    children: [
                      _buildAction(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RetailerClaimPointScreen()));
                        },
                        'Claim Points',
                        'assets/retailer_assets/icons/shop_alt_icon.webp',
                        screenWidth,
                      ),
                      _buildAction(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RetailerRedemptionScreen()));
                        },
                        'Redemption Catalogue',
                        'assets/retailer_assets/icons/cart_shopping_icon.webp',
                        screenWidth,
                      ),
                      _buildAction(
                        onTap: (){

                        },
                        'Dream Gift',
                        'assets/retailer_assets/icons/gift_icon.webp',
                        screenWidth,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(
      {required Widget child,
        double? width,
        double? height,
        EdgeInsetsGeometry? padding}) {
    return Container(
      height: height,
      width: width,
      padding: padding ?? EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: CustColors.nile_blue,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: child,
    );
  }

  Widget _buildAction(String label, String imageUrl, double screenWidth,{VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6.0),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 2, spreadRadius: 0)
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: SizedBox(
                      child: Image.asset(
                        imageUrl,
                        width: screenWidth * 0.1,
                      ))),
              SizedBox(height: 5),
              Expanded(
                  flex: 3,
                  child: Container(
                      width: double.infinity,
                      color: CustColors.nile_blue,
                      child: Center(
                          child: Text(
                            label,
                            style: TextStyle(
                                fontSize: (screenWidth * 0.045) * 0.8,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                height: 1),
                            textAlign: TextAlign.center,
                          )),
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02)
                  ))
            ],
          ),
        ),
      ),
    );
  }

}