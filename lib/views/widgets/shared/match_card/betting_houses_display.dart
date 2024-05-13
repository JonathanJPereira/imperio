import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BettingHousesDisplay extends StatelessWidget {
  final double onexbetOdd;
  final double betsafeOdd;
  final double betssonOdd;

  const BettingHousesDisplay(
      {super.key,
      required this.onexbetOdd,
      required this.betsafeOdd,
      required this.betssonOdd});

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
            const VerticalDivisor(),
            BettingHouseInfo(
              title: 'X',
              imgAsset: 'assets/images/betting_houses/betsafe.png',
              odd: NumberFormat.compact().format(betsafeOdd),
            ),
            const VerticalDivisor(),
            BettingHouseInfo(
              title: 'Fora',
              imgAsset: 'assets/images/betting_houses/betsson.png',
              odd: NumberFormat.compact().format(betssonOdd),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: const Divider(
            height: 1,
          ),
        ),
      ],
    );
  }
}

class VerticalDivisor extends StatelessWidget {
  const VerticalDivisor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 26,
      width: 1.0,
      color: const Color(0xFFDEE0DF),
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
