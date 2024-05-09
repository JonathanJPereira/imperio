import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  final double height;

  const GradientBackground({
    this.height = 500,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            backgroundColor,
          ],
        ),
      ),
    );
  }
}
