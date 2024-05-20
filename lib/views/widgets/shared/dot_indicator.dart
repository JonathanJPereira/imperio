import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final double size;

  const DotIndicator({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.red,
      ),
    );
  }
}
