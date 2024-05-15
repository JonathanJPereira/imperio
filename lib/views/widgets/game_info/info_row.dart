import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final Widget start;
  final Widget end;
  final EdgeInsets padding;

  const InfoRow(
      {super.key,
      required this.start,
      required this.end,
      this.padding = const EdgeInsets.all(20)});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [start, end],
          ),
        ),
        const Divider()
      ],
    );
  }
}
