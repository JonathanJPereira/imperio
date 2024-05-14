import 'package:flutter/material.dart';

class ActionPromptRow extends StatelessWidget {
  final String title;
  final MainAxisAlignment mainAxisAlignment;

  const ActionPromptRow(
      {required this.title,
      super.key,
      this.mainAxisAlignment = MainAxisAlignment.center});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary.withOpacity(0.6),
              fontWeight: FontWeight.w700,
              fontSize: 14),
        ),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          ),
          child: const Icon(Icons.arrow_forward),
        )
      ],
    );
  }
}
