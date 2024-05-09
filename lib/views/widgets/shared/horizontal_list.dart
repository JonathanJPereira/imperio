import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double height;
  final double itemDistance;

  const HorizontalList({
    required this.itemBuilder,
    required this.itemCount,
    required this.height,
    this.itemDistance = 11,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      height: height,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: itemDistance),
        clipBehavior: Clip.none,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
      ),
    );
  }
}
