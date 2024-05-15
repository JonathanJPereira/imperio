import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double height;
  final double itemDistance;
  final double horizontalPadding;

  const HorizontalList({
    required this.itemBuilder,
    required this.itemCount,
    required this.height,
    this.itemDistance = 11,
    super.key,
    this.horizontalPadding = 25,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
