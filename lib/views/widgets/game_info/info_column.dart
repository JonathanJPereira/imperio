import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  final Widget top;
  final Widget bottom;

  const InfoColumn({super.key, required this.top, required this.bottom});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        top,
        const SizedBox(
          height: 8,
        ),
        bottom,
      ],
    );
  }
}
