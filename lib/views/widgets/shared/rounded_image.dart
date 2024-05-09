import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  final String imgUrl;

  const RoundedImage({
    required this.imgUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 44,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
