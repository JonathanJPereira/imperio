import 'package:flutter/material.dart';

class ViewMore extends StatelessWidget {
  final VoidCallback onPress;

  const ViewMore({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: TextButton.styleFrom(
        shadowColor: Colors.transparent,
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
      child: const Text('Ver mais'),
    );
  }
}
