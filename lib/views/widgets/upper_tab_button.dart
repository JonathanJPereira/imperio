import 'package:flutter/material.dart';

class UpperTabButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const UpperTabButton({
    required this.icon,
    required this.text,
    super.key,
  });

  String capitalizeFirstOfEach(String text) {
    if (text.isEmpty) return text;
    return text[0].toUpperCase() + text.substring(1).toLowerCase();
  }

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(icon),
          const SizedBox(width: 8),
          Text(capitalizeFirstOfEach(text)),
        ],
      ),
    );
  }
}
