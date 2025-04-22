import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:service_partner/dashboard_type/user_ui/api_service/get_product_details_from_api/get_products_details_from_product_id.dart';
import 'package:service_partner/dashboard_type/user_ui/models/product_category_data.dart';
import 'package:service_partner/dashboard_type/user_ui/models/product_details_data.dart';
import 'package:service_partner/dashboard_type/user_ui/screens/product_details_screen/product_details_screen.dart';
import 'package:service_partner/dashboard_type/user_ui/screens/user_claim_point_screen.dart';
import 'package:service_partner/dashboard_type/user_ui/screens/navigations/user_redemption_screen.dart';
import 'package:service_partner/screens/splash/splash_screen.dart';
import 'package:service_partner/utilities/constant.dart';
import 'package:service_partner/utilities/cust_colors.dart';
import 'package:service_partner/widgets/cust_loader.dart';
import 'package:service_partner/widgets/custom_network_image/custom_network_image.dart';
import 'package:service_partner/widgets/custom_slider/custom_slider.dart';
import '../../utilities/user_urls.dart';




class UserHomeScreen extends StatefulWidget {
  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  List<ProductCategoryData> _productCategory = [];
  List<ProdDetailsList?> _allProducts = [];
  List<GlobalKey> _productKeys = [];
  late Future<bool> _isInit;

  Future<bool> init() async {
    String token = Pref.instance.getString(Consts.user_token) ?? '';
    try {
      var uri = Uri.https(UserUrls.base_url, UserUrls.product_catagory);

      var response = await get(uri, headers: {
        'authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      });

      // Process the response based on status code
      if (response.statusCode == 200) {
        var rawData = json.decode(response.body);
        bool isSuccess = rawData['isScuss'] ?? false;
        if (isSuccess) {
          var productData = rawData['data'] as List<dynamic>;
          _productCategory = productData
              .map((e) => ProductCategoryData.fromJson(e as Map<String, dynamic>))
              .toList();
          _productKeys.clear();
          for(int i = 0 ;i<_productCategory.length;i++){
            _productKeys.add(GlobalKey());
          }
          _allProducts = await GetProdDetailsByProductId.getAllProductListByID(_productCategory)??[];
        } else {
          print('API error: ${rawData['messages']}');
        }
      } else if (response.statusCode == 400) {
        // Bad Request: The request was invalid.
        var rawData = json.decode(response.body);
        print('Bad Request: ${rawData['messages'] ?? 'Invalid Request'}');
      } else if (response.statusCode == 401) {
        // Unauthorized: Authentication failed.
        print('Unauthorized: Please log in again.');
        // Optionally, navigate to the login screen.
      } else if (response.statusCode == 403) {
        // Forbidden: You don't have permission.
        print('Forbidden: Access denied.');
      } else if (response.statusCode == 404) {
        // Not Found: Resource not found.
        print('Not Found: The requested resource was not found.');
      } else if (response.statusCode >= 500 && response.statusCode < 600) {
        // Server error: Something went wrong on the server side.
        print('Server Error: Please try again later.');
      } else {
        // Handle any other unexpected status codes.
        print('Unexpected error: Status code ${response.statusCode}');
      }
    } catch (exception, trace) {
      print('Exception: $exception, Trace: $trace');
      return false;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    _isInit = init();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: FutureBuilder(
        future: _isInit,
        builder:(context,snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // top card design
                  SizedBox(
                    height: screenHeight * 0.28,
                    child:  CustomSlider(),
                  ),
                  SizedBox(height: screenHeight * 0.02),

                  // menu items

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 15,
                      shrinkWrap: true,
                      children: [
                        _buildAction(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UserClaimPointScreen()));
                          },
                          'Claim Points',
                          'assets/user_assets/icons/shop_alt_icon.webp',
                          screenWidth,
                        ),
                        _buildAction(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    UserRedemptionScreen()));
                          },
                          'Redemption Catalogue',
                          'assets/user_assets/icons/cart_shopping_icon.webp',
                          screenWidth,
                        ),
                        _buildAction(
                          onTap: () {},
                          'Dream Gift',
                          'assets/user_assets/icons/gift_icon.webp',
                          screenWidth,
                        ),
                      ],
                    ),
                  ),

                  _categoryListButtons(products: _productCategory,keys: _productKeys,
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _allProducts.length,
                    itemBuilder: (context, index) {
                      final product = _allProducts[index];
                      return CategorizedProduct(
                        key: _productKeys[index],
                        productData: product!.data,
                        label: product.categoryName ?? '',
                      );
                    },
                  ),

                  SizedBox(
                    height: screenWidth * 0.05,
                  )

                ],
              ),
            );
          }else{
            return Center(child: CustLoader(color: CustColors.nile_blue,),);
          }
        }
      ),
    );
  }


  Widget _buildAction(String label, String imageUrl, double screenWidth,
      {VoidCallback? onTap}) {
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
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02)))
            ],
          ),
        ),
      ),
    );
  }

}


class CategorizedProduct extends StatelessWidget {
  final String label;
  final List<ProductDetails> productData;

  const CategorizedProduct({
    Key? key,
    required this.label,
    required this.productData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double gridSpacing = screenWidth * 0.03;

    return SizedBox(
      height: screenWidth * 0.65,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          const SizedBox(height: 10.0),
          Flexible(
            fit: FlexFit.loose,
            child: productData.isEmpty
                ? const Center(child: Text('Empty'))
                : ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: productData.length > 10 ? 11 : productData.length,
                itemBuilder: (context, index) {
                  if (index == 10) {
                    return Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustColors.nile_blue,
                          foregroundColor: CustColors.white,
                          shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        ),
                        child: const Text('See More'),
                      ),
                    );
                  } else {
                    var data = productData[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: ProductTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailsScreen(productDetails: productData[index],),
                            ),
                          );
                        },
                        price: data.uprice,
                        imageUrl: data.prodPic,
                        title: data.prdName,
                        unit: data.unitType,
                        perUnit: data.quantityPerUnit,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String price;
  final String unit;
  final String perUnit;
  final VoidCallback? onTap;

  const ProductTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.unit,
    required this.perUnit,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.38,
        margin: const EdgeInsets.only(right: 10,bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            // Product Image
            CustomNetworkImage(imageUrl: imageUrl,
              height: screenWidth * 0.3,
              width: double.infinity,
              fit: BoxFit.cover,
              borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
            ),
            
            // Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Points $price",
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${perUnit} Per $unit",
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class _categoryListButtons extends StatelessWidget{
  final List<ProductCategoryData> products;
  final List<GlobalKey>? keys;
  _categoryListButtons({required this.products,this.keys});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Category',style: Theme.of(context).textTheme.headlineSmall,),
          Container(
            margin: EdgeInsets.symmetric(vertical: 12.0),
            height: 50,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: keys !=null ?(){
                    Scrollable.ensureVisible(
                      keys![index].currentContext!,
                      duration: Duration(milliseconds: 500),
                      alignment: 0.5, // Optional: 0.0 top, 1.0 bottom, 0.5 center
                    );
                  }:null,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustColors.orange,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    margin: EdgeInsets.only(right: 8.0),
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    alignment: Alignment.center,
                    child: Text(product.catName ?? ''),
                  ),
                );
              },
            )
          ),
        ],
      ),
    );
  }

}
