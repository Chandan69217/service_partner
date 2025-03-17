import 'package:flutter/material.dart';
import 'package:service_partner/utilities/cust_colors.dart';


class RetailerClaimPointScreen extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      "category": "CPVC - PIPE",
      "image": "https://storage.googleapis.com/a1aa/image/8Z-W1J-cnidG6d8tD-66sEdeuwmlAA0mkeIyHhYm6b8.jpg"
    },
    {
      "category": "CPVC - FITTINGS",
      "image": "https://storage.googleapis.com/a1aa/image/X_6tXNCOIEh6roGfP_OobD4Ah9wy1Ci5mQR4zNiQW4U.jpg"
    },
    {
      "category": "UPVC - PIPE",
      "image": "https://storage.googleapis.com/a1aa/image/Z-ondA_5jrYpavLZt9CRrVLeGMCHs8FXAUZ7iGAgvQ4.jpg"
    },
    {
      "category": "UPVC - FITTINGS",
      "image": "https://storage.googleapis.com/a1aa/image/EVizCu8K5mjvHJFcw-OZ_ruBoF9cBAXoziPo4eWTGuE.jpg"
    },
    {
      "category": "SWR - PIPE",
      "image": "https://storage.googleapis.com/a1aa/image/zEXDG9d9YE0Vo3qQ0d99S1SytmMWz0whgahkxO2y7m0.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: CustColors.cyan,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: CustColors.nile_blue,
        title: Text("Claim Points",style: TextStyle(fontSize: screenWidth * 0.05)),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.notifications),onPressed: (){},)],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 10),
            color: Colors.white,
            child: Column(
              children: [
                Text(
                  "Submit your claim to earn points",
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: screenWidth * 0.12,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: CustColors.nile_blue),
                      ),
                    ),
                    value: "Barik Enterprise",
                    style: TextStyle(fontSize: screenWidth * 0.04,color: Colors.black),
                    items: [
                      DropdownMenuItem(
                        child: Text("Barik Enterprise"),
                        value: "Barik Enterprise",
                      )
                    ],
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            products[index]['category']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Image.network(
                          products[index]['image']!,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: screenWidth * 0.2,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter Qty",
                            ),
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[900],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {},
              child: Text(
                "SUBMIT",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}



