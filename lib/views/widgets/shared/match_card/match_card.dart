import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/match_card/live_indicator.dart';
import 'package:imperio/views/widgets/shared/match_card/match_score_display.dart';
import 'package:imperio/views/widgets/shared/match_card/team_logo.dart';
import 'package:imperio/views/widgets/shared/match_card/time_line.dart';
import 'package:imperio/views/widgets/shared/match_card/view_more.dart';

class MatchCard extends StatelessWidget {
  const MatchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: const Color(0xFFDEE0DF)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: const Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TeamLogo(name: 'São Paulo'),
              LiveIndicator(),
              TeamLogo(name: 'Palmeiras'),
            ],
          ),
          MatchScoreDisplay(scoreTeamOne: 2, scoreTeamTwo: 2),
          TimeLine(),
          BettingHousesDisplay(),
          ViewMore()
        ],
      ),
    );
  }
}
