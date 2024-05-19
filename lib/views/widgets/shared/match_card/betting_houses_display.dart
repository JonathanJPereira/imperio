import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/vertical_divisor.dart';
import 'package:intl/intl.dart';

class BettingHousesDisplay extends StatelessWidget {
  final double onexbetOdd;
  final double betsafeOdd;
  final double betssonOdd;
  final Color? colorDivisor;

  const BettingHousesDisplay({
    super.key,
    required this.onexbetOdd,
    required this.betsafeOdd,
    required this.betssonOdd,
    this.colorDivisor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BettingHouseInfo(
              title: 'Casa',
              imgAsset: 'assets/images/betting_houses/1xbet.png',
              odd: NumberFormat.compact().format(onexbetOdd),
            ),
            VerticalDivisor(color: colorDivisor),
            BettingHouseInfo(
              title: 'X',
              imgAsset: 'assets/images/betting_houses/betsafe.png',
              odd: NumberFormat.compact().format(betsafeOdd),
            ),
            VerticalDivisor(color: colorDivisor),
            BettingHouseInfo(
              title: 'Fora',
              imgAsset: 'assets/images/betting_houses/betsson.png',
              odd: NumberFormat.compact().format(betssonOdd),
            ),
          ],
        ),
      ],
    );
  }
}

class BettingHouseInfo extends StatelessWidget {
  final String title;
  final String imgAsset;
  final String odd;

  const BettingHouseInfo({
    super.key,
    required this.title,
    required this.imgAsset,
    required this.odd,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.8),
            fontSize: 10,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6, bottom: 8),
          child: Image.asset(
            imgAsset,
            width: 65,
          ),
        ),
        Text(
          odd,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
