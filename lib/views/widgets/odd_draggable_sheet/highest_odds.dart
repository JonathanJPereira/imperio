import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';

import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:intl/intl.dart';

class HighestOdds extends StatelessWidget {
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();
  final Animation<Color?> colorAnimation;
  final Animation<double> paddingAnimation;

  HighestOdds(
      {super.key,
      required this.colorAnimation,
      required this.paddingAnimation});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: Listenable.merge([paddingAnimation]),
        builder: (context, child) {
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: 15.0, vertical: paddingAnimation.value / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildBettingHousesDisplay(),
                const SizedBox(height: 20),
                _buildOddsTable(),
              ],
            ),
          );
        });
  }

  Widget _buildBettingHousesDisplay() {
    return AnimatedBuilder(
      animation: Listenable.merge([colorAnimation, paddingAnimation]),
      builder: (context, child) {
        return Container(
          padding: EdgeInsets.all(paddingAnimation.value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(36),
            color: colorAnimation.value,
          ),
          child: const BettingHousesDisplay(
            onexbetOdd: 3.4,
            betsafeOdd: 2.4,
            betssonOdd: 3.5,
            colorDivisor: Colors.black38,
          ),
        );
      },
    );
  }

  Widget _buildOddsTable() {
    return Observer(
      builder: (_) {
        if (matchesStore.matchOdds.isEmpty) {
          return const CircularProgressIndicator();
        }

        final oddsMatch = matchesStore.matchOdds.first;
        final odds = [
          [
            oddsMatch.teamA1xbetOdd,
            oddsMatch.teamABetsafeOdd,
            oddsMatch.teamABetssonOdd
          ],
          [
            oddsMatch.teamB1xbetOdd,
            oddsMatch.teamBBetsafeOdd,
            oddsMatch.teamBBetssonOdd
          ],
          [
            oddsMatch.draw1xbetOdd,
            oddsMatch.drawBetsafeOdd,
            oddsMatch.drawBetssonOdd
          ],
        ];

        return AnimatedBuilder(
          animation: colorAnimation,
          builder: (context, child) {
            return Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(36),
                color: colorAnimation.value,
              ),
              child: Column(
                children: [
                  const Text(
                    'Casa apostadora',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Table(
                    columnWidths: const {
                      0: FixedColumnWidth(100),
                      1: FixedColumnWidth(50),
                      2: FlexColumnWidth(),
                      3: FlexColumnWidth(),
                      4: FlexColumnWidth(),
                    },
                    children: [
                      _buildHeaderRow(),
                      ..._buildOddsRows(odds),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        Center(
          child: CustomNetworkImage(
            imgUrl: matchesStore.currentMatch?.teamAImage ?? '',
          ),
        ),
        Center(
          child: Container(
            height: 45,
            alignment: Alignment.center,
            child: const Text(
              'VS',
              style: TextStyle(
                fontSize: 14.6,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Center(
          child: CustomNetworkImage(
            imgUrl: matchesStore.currentMatch?.teamBImage ?? '',
          ),
        ),
      ],
    );
  }

  List<TableRow> _buildOddsRows(List<List<double>> odds) {
    final bettingHouseLogos = [
      'assets/images/betting_houses/1xbet.png',
      'assets/images/betting_houses/betsafe.png',
      'assets/images/betting_houses/betsson.png',
    ];

    final List<TableRow> rows = [];
    for (var i = 0; i < odds.length; i++) {
      final maxOdd = odds[i].reduce((a, b) => a > b ? a : b);
      rows.add(
        TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: _buildHouse(bettingHouseLogos[i]),
            ),
            const SizedBox.shrink(),
            for (var odd in odds[i])
              _buildOddContainer(odd.toString(), odd == maxOdd),
          ],
        ),
      );
    }
    return rows;
  }

  Widget _buildHouse(String assetPath) {
    return Padding(
      padding: const EdgeInsets.only(top: 6.0),
      child: Center(
        child: Image.asset(
          assetPath,
          width: 80,
          height: 40,
        ),
      ),
    );
  }

  Widget _buildOddContainer(String odd, bool isHighlighted) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 32.64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        color: isHighlighted ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(150),
      ),
      child: Text(
        NumberFormat.compact().format(double.parse(odd)),
        style: TextStyle(
          color: isHighlighted ? Colors.white : Colors.black,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          fontSize: 13.3,
        ),
      ),
    );
  }
}
