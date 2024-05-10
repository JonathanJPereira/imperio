import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imgUrl;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final String placeholderPath;
  final BoxFit boxFit;
  final double maxPlaceholderWidth; // Máximo para a largura do placeholder
  final double maxPlaceholderHeight; // Máximo para a altura do placeholder

  const CustomNetworkImage({
    required this.imgUrl,
    this.width = 45.0,
    this.height = 44.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(15.0)),
    this.placeholderPath = 'assets/images/placeholder.png',
    this.boxFit = BoxFit.fill,
    this.maxPlaceholderWidth = 45.0, // Padrão baseado no width
    this.maxPlaceholderHeight = 44.0, // Padrão baseado no height
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: FadeInImage.assetNetwork(
          placeholder: placeholderPath,
          placeholderFit: BoxFit.fitHeight,
          image: imgUrl,
          fit: boxFit,
          width: width,
          height: height,
          imageErrorBuilder: (context, error, stackTrace) => Container(
            constraints: BoxConstraints(
              maxWidth: maxPlaceholderWidth,
              maxHeight: maxPlaceholderHeight,
            ),
            child: Image.asset(
              placeholderPath,
              fit: boxFit,
            ),
          ),
        ),
      ),
    );
  }
}
