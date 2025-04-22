import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final double width;
  final double height;
  final BorderRadius? borderRadius;
  final BoxFit fit;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width = 100,
    this.height = 100,
    this.borderRadius,
    this.fit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      child: FadeInImage.assetNetwork(
        width: width,
        height: height,
        placeholder: 'assets/logo/Placeholder_image.webp',
        image: imageUrl?.isNotEmpty == true ? imageUrl! : '',
        fit: fit,
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            'assets/logo/Placeholder_image.webp',
            width: width,
            height: height,
            fit: fit,
          );
        },
      ),
    );
  }
}
