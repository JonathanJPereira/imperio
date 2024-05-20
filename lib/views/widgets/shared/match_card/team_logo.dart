import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class TeamLogo extends StatelessWidget {
  final String name;
  final String imgUrl;

  const TeamLogo({super.key, required this.name, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 61.5,
            width: 61.5,
            child: Center(
              child: SizedBox(
                  height: 37.5,
                  width: 37.5,
                  child: CustomNetworkImage(imgUrl: imgUrl)),
            ),
          ),
          Text(
            name,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
