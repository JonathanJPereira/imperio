import 'package:flutter/material.dart';

class VerticalDivisor extends StatelessWidget {
  final double height;

  const VerticalDivisor({super.key, this.height = 25});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: 1.0,
      color: const Color(0xFFDEE0DF),
    );
  }
}
