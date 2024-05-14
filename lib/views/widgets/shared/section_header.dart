import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum TextPosition {
  start,
  middle,
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? svg;
  final TextPosition textPosition;

  const SectionHeader({
    required this.title,
    this.svg,
    this.textPosition = TextPosition.start,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: textPosition == TextPosition.start
            ? MainAxisAlignment.start
            : MainAxisAlignment.center,
        children: [
          if (svg != null)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: SvgPicture.asset(
                svg!,
                width: 24,
              ),
            ),
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
