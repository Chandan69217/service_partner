import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class RetailerProfileScreen extends StatefulWidget {
  @override
  State<RetailerProfileScreen> createState() => _RetailerProfileScreenState();
}

class _RetailerProfileScreenState extends State<RetailerProfileScreen> {
  String? _selectedRegistrationType;
  List<String> _radioOptions = ['Consumer','Plumber','Dealer','Distributor',];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: CustColors.yellow,
        title: Text('Profile'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: screenHeight * 0.05),
          // Registration Box
          Container(
            padding: EdgeInsets.only(top: screenWidth * 0.05),
            margin: EdgeInsets.symmetric(horizontal:screenWidth * 0.05 ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black.withOpacity(0.1), width: 1.2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:  screenWidth *0.06),
                  child: Text(
                    'Select Registration Type',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.019),
                Divider(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth *0.04),
                      child: RadioOption(
                        label: _radioOptions[0],
                        groupVlaue: _selectedRegistrationType,
                        onChange: (value) {
                          setState(() {
                            _selectedRegistrationType = value;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth *0.04),
                      child: RadioOption(
                        label: _radioOptions[1],
                        groupVlaue: _selectedRegistrationType,
                        onChange: (value) {
                          setState(() {
                            _selectedRegistrationType = value;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth *0.04),
                      child: RadioOption(
                        label: _radioOptions[2],
                        groupVlaue: _selectedRegistrationType,
                        onChange: (value) {
                          setState(() {
                            _selectedRegistrationType = value;
                          });
                        },
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth *0.04),
                      child: RadioOption(
                        label: _radioOptions[3],
                        groupVlaue: _selectedRegistrationType,
                        onChange: (value) {
                          setState(() {
                            _selectedRegistrationType = value;
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),

          // Go Button
          SizedBox(height: screenHeight * 0.05),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: CustColors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(screenWidth * 0.05),bottomLeft: Radius.circular(screenWidth * 0.05)),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'GO',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenWidth * 0.01),
        ],
      ),
    );
  }
}

class RadioOption extends StatelessWidget {
  final String label;
  final String? groupVlaue;
  final Function(String? vlaue)? onChange;

  const RadioOption({required this.label,this.groupVlaue,this.onChange});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChange != null) {
          onChange!(label);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Radio(
              activeColor: CustColors.yellow,
              value: label,
              groupValue: groupVlaue,
              onChanged: onChange,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
