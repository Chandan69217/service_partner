import 'dart:async';
import 'package:flutter/material.dart';
import 'package:service_partner/widgets/custom_network_image/custom_network_image.dart';


class CustomSlider extends StatefulWidget {
  final VoidCallback? onPressed;

  const CustomSlider({super.key, this.onPressed});
  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<CustomSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> imageUrls = [
    'assets/user_assets/images/banner.webp',
    'assets/user_assets/images/bestsellersbanner.webp',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.page == imageUrls.length - 1) {
        _pageController.jumpToPage(0);
      } else {
        _pageController.nextPage(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: screenHeight * 0.28,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(screenWidth*0.015),
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.1),
          //     offset: Offset(0, 4),
          //     blurRadius: 8,
          //   ),
          // ],
        ),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: _pageController,
              itemCount: imageUrls.length,
              onPageChanged: (page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        color: Colors.black.withOpacity(0.1),
                        // spreadRadius: 1,
                      )
                    ],
                  ),
                  child: CustomNetworkImage(imageUrl: '',
                    borderRadius: BorderRadius.zero,
                  )
                );
              },
            ),
            // Indicator
            Positioned(
              bottom: (screenHeight * 0.3) * 0.05,
              child: Row(
                children: List.generate(imageUrls.length, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    height: (screenHeight * 0.23) * 0.041,
                    width: _currentPage == index
                        ? (screenHeight * 0.23) * 0.11
                        : (screenHeight * 0.23) * 0.041,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.white : Colors.grey,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}