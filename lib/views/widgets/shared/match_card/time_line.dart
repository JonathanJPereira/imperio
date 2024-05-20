import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Enums
enum IconType { ball, card }

enum IndicatorDirection { up, down }

// Constantes para estilos
const double _iconSize = 26.4;
const Color _defaultLineColor = Color(0xFFF4F4F4);
const Color _defaultIconBorderColor = Color(0xFFC0C4C2);

// TimeLine Widget
class TimeLine extends StatelessWidget {
  final String startLabel;
  final String endLabel;
  final Color lineColor;

  const TimeLine({
    super.key,
    this.startLabel = '0',
    this.endLabel = '90',
    this.lineColor = _defaultLineColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(startLabel),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 4,
                      color: lineColor,
                    ),
                  ),
                  FractionallySizedBox(
                    widthFactor: 0.54,
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: 4,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.15,
                    child: TimelineEvent(
                      iconType: IconType.card,
                      indicatorDirection: IndicatorDirection.down,
                      color: Color(0xFFF5D70A),
                    ),
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.3,
                    child: TimelineEvent(
                      iconType: IconType.card,
                      indicatorDirection: IndicatorDirection.up,
                      color: Colors.red,
                    ),
                  ),
                  const FractionallySizedBox(
                    widthFactor: 0.5,
                    child: TimelineEvent(
                      iconType: IconType.ball,
                      indicatorDirection: IndicatorDirection.up,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(endLabel),
        ],
      ),
    );
  }
}

// TimelineEvent Widget
class TimelineEvent extends StatelessWidget {
  final IndicatorDirection indicatorDirection;
  final IconType iconType;
  final Color color;

  const TimelineEvent({
    super.key,
    required this.iconType,
    required this.indicatorDirection,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildIndicatorOrSpacer(
            showIndicator: indicatorDirection == IndicatorDirection.up,
            direction: IndicatorDirection.up,
          ),
          TimelineIcon(
            iconType: iconType,
            color: color,
          ),
          _buildIndicatorOrSpacer(
            showIndicator: indicatorDirection == IndicatorDirection.down,
            direction: IndicatorDirection.down,
          ),
        ],
      ),
    );
  }

  Widget _buildIndicatorOrSpacer({
    required bool showIndicator,
    required IndicatorDirection direction,
  }) {
    return showIndicator
        ? Indicator(
            direction: direction,
            color: color,
          )
        : const SizedBox(height: 10);
  }
}

// TimelineIcon Widget
class TimelineIcon extends StatelessWidget {
  final IconType iconType;
  final Color color;

  const TimelineIcon({
    super.key,
    required this.iconType,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: _iconSize,
      width: _iconSize,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(120),
        border: Border.all(
          width: 1.2,
          color: _defaultIconBorderColor,
        ),
      ),
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(_getIconPath(iconType)),
      ),
    );
  }

  String _getIconPath(IconType iconType) {
    switch (iconType) {
      case IconType.ball:
        return 'assets/images/ball.svg';
      case IconType.card:
        return 'assets/images/sport_card.svg';
      default:
        return '';
    }
  }
}

// Indicator Widget
class Indicator extends StatelessWidget {
  final IndicatorDirection direction;
  final Color color;

  const Indicator({
    super.key,
    required this.direction,
    required this.color,
  });

  String get assetPath {
    switch (direction) {
      case IndicatorDirection.up:
        return 'assets/images/indicator_up.svg';
      case IndicatorDirection.down:
        return 'assets/images/indicator_down.svg';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 10,
      child: ColorFiltered(
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
        child: SvgPicture.asset(assetPath),
      ),
    );
  }
}
