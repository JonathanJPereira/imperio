import 'package:flutter/material.dart';
import 'package:imperio/utils/capitalize_first_of_each.dart';

class UpperTabButton extends StatelessWidget {
  final IconData icon;
  final String text;

  const UpperTabButton({
    required this.icon,
    required this.text,
    super.key,
  });

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
