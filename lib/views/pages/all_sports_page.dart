import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/footer/footer.dart';
import 'package:imperio/views/widgets/last_bets_won/last_bets_won.dart';  
import 'package:imperio/views/widgets/popular_championships/popular_championships.dart';
import 'package:imperio/views/widgets/principal_bonus/principal_bonus.dart';
import 'package:imperio/views/widgets/shared/gradient_background.dart';
import 'package:imperio/views/widgets/sport_banner/sports_banner.dart';
import 'package:imperio/views/widgets/tips_list/tips_list.dart';

class AllSportsPage extends StatelessWidget {
  const AllSportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const itemDistance = 30.0;

    return Container(
      color: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Stack(
            children: [
              const GradientBackground(),
              Column(
                children: [
                  SportsBanner(),
                  const PopularChampionships(),
                  // MatchList(),
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
            ],
          ),
        ),
      ),
    );
  }
}
