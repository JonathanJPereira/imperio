import 'package:flutter/material.dart';
import 'package:imperio/utils/imperio_icons.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.secondary)),
      onPressed: () {},
      icon: const Icon(
        ImperioIcons.iconShareOutline,
        size: 15,
      ),
    );
  }
}
