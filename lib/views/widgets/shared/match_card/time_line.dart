import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TimeLine extends StatelessWidget {
  final String startLabel;
  final String endLabel;
  final Color lineColor;
  final String indicatorUpPath;
  final String indicatorDownPath;
  final String ballPath;

  const TimeLine({
    super.key,
    this.startLabel = '0',
    this.endLabel = '90',
    this.lineColor = const Color(0xFFF4F4F4),
    this.indicatorUpPath = 'assets/images/indicator_up.svg',
    this.indicatorDownPath = 'assets/images/indicator_down.svg',
    this.ballPath = 'assets/images/ball.svg',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(startLabel),
          Expanded(
            child: TimelineWidget(
              lineColor: lineColor,
              indicatorUpPath: indicatorUpPath,
              indicatorDownPath: indicatorDownPath,
              ballPath: ballPath,
            ),
          ),
          Text(endLabel),
        ],
      ),
    );
  }
}

class TimelineWidget extends StatelessWidget {
  final Color lineColor;
  final String indicatorUpPath;
  final String indicatorDownPath;
  final String ballPath;

  const TimelineWidget({
    super.key,
    required this.lineColor,
    required this.indicatorUpPath,
    required this.indicatorDownPath,
    required this.ballPath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          child: Container(
            height: 4,
            color: lineColor,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Indicator(assetPath: indicatorUpPath),
            Ball(ballPath: ballPath),
            Indicator(assetPath: indicatorDownPath),
          ],
        ),
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final String assetPath;

  const Indicator({
    super.key,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.black87,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}

class Ball extends StatelessWidget {
  final String ballPath;

  const Ball({
    super.key,
    required this.ballPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: 26.4,
      width: 26.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(120),
        border: Border.all(
          width: 1.2,
          color: const Color(0xFFC0C4C2),
        ),
      ),
      child: ColorFiltered(
        colorFilter: const ColorFilter.mode(
          Colors.grey,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(ballPath),
      ),
    );
  }
}
