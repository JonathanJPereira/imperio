import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/stores/odds_matches_store.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

class HighestOdds extends StatelessWidget {
  final OddsMatchesStore oddsMatchesStore = GetIt.I<OddsMatchesStore>();
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();

  HighestOdds({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBettingHousesDisplay(),
          const SizedBox(height: 20),
          _buildOddsTable(),
        ],
      ),
    );
  }

  Widget _buildBettingHousesDisplay() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: const Color(0xFFC0C4C2),
      ),
      child: const BettingHousesDisplay(
        onexbetOdd: 3.4,
        betsafeOdd: 2.4,
        betssonOdd: 3.5,
        colorDivisor: Colors.black38,
      ),
    );
  }

  Widget _buildOddsTable() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        color: const Color(0xFFC0C4C2),
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
              _buildOddsRow(
                'assets/images/betting_houses/1xbet.png',
                '3.2',
                '2.6',
                '2.6',
                true,
                false,
                false,
              ),
              _buildOddsRow(
                'assets/images/betting_houses/betsafe.png',
                '2.2',
                '2.6',
                '2.1',
                false,
                true,
                false,
              ),
              _buildOddsRow(
                'assets/images/betting_houses/betsson.png',
                '2.6',
                '2.6',
                '3.4',
                false,
                false,
                true,
              ),
            ],
          ),
        ],
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        const SizedBox.shrink(),
        const SizedBox.shrink(),
        Center(
          child: CustomNetworkImage(
            imgUrl: matchesStore.currentMatch!.teamAImage,
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
            imgUrl: matchesStore.currentMatch!.teamBImage,
          ),
        ),
      ],
    );
  }

  TableRow _buildOddsRow(
    String assetPath,
    String odd1,
    String odd2,
    String odd3,
    bool isOdd1Highest,
    bool isOdd2Highest,
    bool isOdd3Highest,
  ) {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: _buildHouse(assetPath),
        ),
        const SizedBox.shrink(),
        _buildOddContainer(odd1, isOdd1Highest),
        _buildOddContainer(odd2, isOdd2Highest),
        _buildOddContainer(odd3, isOdd3Highest),
      ],
    );
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
        odd,
        style: TextStyle(
          color: isHighlighted ? Colors.white : Colors.black,
          fontWeight: isHighlighted ? FontWeight.bold : FontWeight.normal,
          fontSize: 13.3,
        ),
      ),
    );
  }
}
