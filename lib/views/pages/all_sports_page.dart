import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/footer/footer.dart';
import 'package:imperio/views/widgets/last_bets_won/last_bets_won.dart';
import 'package:imperio/views/widgets/match_list/match_list.dart';
import 'package:imperio/views/widgets/popular_championships/popular_championships.dart';
import 'package:imperio/views/widgets/principal_bonus/principal_bonus.dart';
import 'package:imperio/views/widgets/sport_banner/sports_banner.dart';
import 'package:imperio/views/widgets/tips_list/tips_list.dart';

class AllSports extends StatelessWidget {
  const AllSports({super.key});

  @override
  Widget build(BuildContext context) {
    const itemDistance = 30.0;

    return SingleChildScrollView(
      child: Column(
        children: [
          SportsBanner(),
          const PopularChampionships(),
          const MatchList(),
          const SizedBox(height: itemDistance),
          const TipsList(),
          const SizedBox(height: itemDistance),
          const PrincipalBonus(),
          const SizedBox(height: itemDistance),
          LastBetsWon(),
          const SizedBox(height: itemDistance),
          const Footer(),
        ],
      ),
    );
  }
}
