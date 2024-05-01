import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).colorScheme.primary;
    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Container(
      height: 500,
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
