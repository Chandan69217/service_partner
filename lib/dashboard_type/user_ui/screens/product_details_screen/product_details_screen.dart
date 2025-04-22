import 'package:flutter/material.dart';
import 'package:service_partner/dashboard_type/user_ui/models/product_details_data.dart';
import 'package:service_partner/widgets/custom_network_image/custom_network_image.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetails productDetails;
  ProductDetailsScreen({required this.productDetails});
  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int totalPrice = 0;
  int selectedQuantity = 1;

  @override
  void initState() {
    super.initState();
    _calculateTotalPrice(); // initial total price
  }

  void _calculateTotalPrice() {
    int unitPrice = int.tryParse(widget.productDetails.quantityPerUnit.toString()) ?? 0;
    setState(() {
      totalPrice = unitPrice * selectedQuantity;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final data = widget.productDetails;

    return Scaffold(
      appBar: AppBar(
        title: Text('Buy ${data.prdName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Product Image
            CustomNetworkImage(imageUrl: data.prodPic),
            const SizedBox(height: 16),

            // Product Info
            Text(
              data.prdName.toString(),
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Unit Price: ₹${data.quantityPerUnit} / ${data.unitType}',
              style: TextStyle(fontSize: 16),
            ),

            const SizedBox(height: 20),

            // Quantity Selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Quantity:', style: TextStyle(fontSize: 16)),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: selectedQuantity > 1
                          ? () {
                        setState(() {
                          selectedQuantity--;
                        });
                        _calculateTotalPrice();
                      }
                          : null,
                    ),
                    Text(
                      '$selectedQuantity',
                      style: TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          selectedQuantity++;
                        });
                        _calculateTotalPrice();
                      },
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 20),

            // Total Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(
                  '₹$totalPrice',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
              ],
            ),

            Spacer(),

            // Buy Now Button
            SizedBox(
              width: screenWidth,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Purchased $selectedQuantity ${data.prdName}!"),
                  ));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text('Buy Now', style: TextStyle(fontSize: 18)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

