import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class UserHelplineScreen extends StatelessWidget {
  const UserHelplineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05),
        child: Column(
          children: [
            _buildCard(
              screenWidth,
              'Call to Contact Center',
              'https://storage.googleapis.com/a1aa/image/2kdcV77oWpcNY92sLaF_6h-540iNiw0fnwpOmM2lp-g.jpg',
            ),
            _buildCard(
              screenWidth,
              'Call to Sales Person',
              'https://storage.googleapis.com/a1aa/image/KAtlyM98mf_N-j5J0qCqdfImPRD-f3VMtMTFPL1ovuk.jpg',
            ),
            _buildCard(
              screenWidth,
              'Retailer Information',
              'https://storage.googleapis.com/a1aa/image/50ouGSGsTKbXKITx1gkyihnw7urJD7F_HLiCLxcjChQ.jpg',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(double screenWidth, String title, String imageUrl) {
    return Container(
      margin: EdgeInsets.only(bottom: screenWidth * 0.04),
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: CustColors.cyan,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: CustColors.nile_blue,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.05),
          Image.network(imageUrl, width: screenWidth * 0.12, height: screenWidth * 0.12),
        ],
      ),
    );
  }
}
