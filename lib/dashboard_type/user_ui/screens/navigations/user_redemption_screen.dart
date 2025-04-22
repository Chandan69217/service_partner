import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/widgets/custom_textfield.dart';

class UserRedemptionScreen extends StatelessWidget {
  UserRedemptionScreen({super.key});

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Tools",
      "products": [
        {
          "name": "Inch tape",
          "image": "https://storage.googleapis.com/a1aa/image/r_Ei-29lFvsFWBjcbjpFhgjffl2FUQ1h3TxSWWAKhqw.jpg",
          "points": 400,
        },
        {
          "name": "Hammer",
          "image": "https://storage.googleapis.com/a1aa/image/yI-nmxZBK9O6v5dxSYyWF4wnCtPwyfAT5pDWsVV3-dI.jpg",
          "points": 1000,
        },
        {
          "name": "Pump",
          "image": "https://storage.googleapis.com/a1aa/image/KRsl7u8EYU0l9sYk2CsmcWj6EEopOzfqVRqsjmj_VdE.jpg",
          "points": 1500,
        }
      ]
    },
    {
      "title": "Vehicles",
      "products": [
        {
          "name": "Bajaj CT 100 KS",
          "image": "https://storage.googleapis.com/a1aa/image/F0Qxqd4Oj250GEWG0YtvidhB9QafoOOViB8nk4lx6MI.jpg",
          "points": 170000,
        },
        {
          "name": "Hero Passion PRO",
          "image": "https://storage.googleapis.com/a1aa/image/GAm3ACH0hW8xA2whcgqpvyjlqd5VNfL9pVTwSRLjU8Y.jpg",
          "points": 225000,
        },
        {
          "name": "TVS Sport",
          "image": "https://storage.googleapis.com/a1aa/image/9ZmVBQtRi6xR3Cm2p5oh57RiX3tK5o4UqahWR8XfKOU.jpg",
          "points": 200000,
        }
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: CustColors.cyan,
      appBar: Navigator.of(context).canPop()
          ? AppBar(
        backgroundColor: CustColors.nile_blue,
        foregroundColor: Colors.white,
        title: Text(
          "Product Catalogue",
          style: TextStyle(fontSize: screenWidth * 0.05),
        ),
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      )
          : null,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.05, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: CustColors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Redeemable Points: 100662",
                    style: TextStyle(
                        color: Colors.white, fontSize: screenWidth * 0.035),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: screenWidth * 0.13,
                  child: CustomFormTextField(
                    key: const ValueKey("search_category_field"),
                    labelText: 'Search Category',
                    radius: 50,
                    isborder: false,
                    prefixIcon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
          ),

          // Category List
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: categories.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: screenWidth * 0.05),
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            category["title"],
                            style: TextStyle(
                                fontSize: screenWidth * 0.05,
                                fontWeight: FontWeight.bold,
                                color: CustColors.nile_blue),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "View more >",
                              style: TextStyle(
                                  fontSize: screenWidth * 0.038,
                                  fontWeight: FontWeight.bold,
                                  color: CustColors.orange),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: screenWidth * 0.6,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemCount: category["products"].length,
                        itemBuilder: (context, index) {
                          var product = category["products"][index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 4.0),
                            child: Container(
                              key: ValueKey('${category["title"]}_${product["name"]}'),
                              width: screenWidth * 0.4,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black26, blurRadius: 5),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.network(
                                      product["image"],
                                      height: (screenWidth * 0.4) * 0.7,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    product["name"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: (screenWidth * 0.4) * 0.1,
                                      color: CustColors.nile_blue,
                                      height: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    category["title"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: (screenWidth * 0.4) * 0.1,
                                      color: CustColors.nile_blue,
                                      height: 1,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "Points: ${product["points"]}",
                                    style: TextStyle(
                                      fontSize: (screenWidth * 0.4) * 0.1,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
