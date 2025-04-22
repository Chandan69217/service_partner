
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';

class ConsumerAboutusScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustColors.yellow,
        automaticallyImplyLeading: false,
        title: Text(
          'Company Profile',
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05,vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Icon(
                        Icons.format_quote,
                        size: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                    Center(
                      child: Text(
                        'WELCOME TO .....',
                        style: TextStyle(
                          fontSize: screenHeight * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: screenWidth * 0.2,
                        height: 2,
                        color: CustColors.nile_blue,
                      ),
                    ),
                    SizedBox(height: 20),

                    SectionTitle('PureFlow Solutions',screenWidth * 0.045),
                    SectionContent(
                      'PureFlow Solutions Private Limited is a celebrated name in the market of Rajkot. We are actively engaged in manufacturing and supplying a wide variety of superior quality products...',
                        screenWidth * 0.035
                    ),
                    SizedBox(height: 20),
        
                    SectionTitle('Our Factory',screenWidth * 0.045),
                    SectionContent(
                      'To manufacture the most advanced products at a rapid pace, we have maintained a state-of-the-art factory at Rajkot...',
                        screenWidth * 0.035
                    ),
                    SizedBox(height: 20),
        
                    SectionTitle('Our Team',screenWidth * 0.045),
                    SectionContent(
                      'A team of some of the most dedicated and experienced professionals is there to handle all our company operations well...',
                        screenWidth * 0.035
                    ),
                    SizedBox(height: 20.0,),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: CustColors.cyan, // Container background color
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          infoRow(context,'Name of CEO', 'Mr. Mitul Patel'),
                          infoRow(context,'Year of Establishment', '2020'),
                          infoRow(context,'Nature of Business', 'Manufacturer & Supplier'),
                          infoRow(context,'GST No.', '24AALCP1709K1ZB'),
        
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(BuildContext context,String label, String value) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: screenWidth * 0.035, // Responsive font size
            ),
          ),
        ),
        Text(':'),
        SizedBox(width: 8.0,),
        Expanded(
          flex: 3,
          child: Text(
            value,
            style: TextStyle(fontSize: screenWidth * 0.03),
          ),
        ),
      ],
    );
  }

  Widget SectionTitle(String title,double fontSize) {
    return Text(
      title,
      style: TextStyle(
        color: Color(0xFF1A4E75),
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget SectionContent(String content,double fontSize) {
    return Text(
      content,
      style: TextStyle(fontSize: fontSize, height: 1.5),
    );
  }

}








