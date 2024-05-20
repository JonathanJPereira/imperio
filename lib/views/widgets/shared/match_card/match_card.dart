import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/stores/matches/matches_store.dart';
import 'package:imperio/views/widgets/shared/match_card/live_indicator.dart';
import 'package:imperio/views/widgets/shared/match_card/match_score_display.dart';
import 'package:imperio/views/widgets/shared/match_card/team_logo.dart';
import 'package:imperio/views/widgets/shared/match_card/time_line.dart';
import 'package:imperio/views/widgets/shared/match_card/view_more.dart';

class MatchCard extends StatelessWidget {
  final Match match;
  final Widget child;
  final bool showDividers;

  const MatchCard({
    super.key,
    required this.match,
    required this.child,
    this.showDividers = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(36),
        border: Border.all(color: Theme.of(context).dividerColor),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TeamLogo(
                name: match.teamA,
                imgUrl: match.teamAImage,
              ),
              const LiveIndicator(),
              TeamLogo(name: match.teamB, imgUrl: match.teamBImage),
            ],
          ),
          MatchScoreDisplay(
            scoreTeamOne: match.teamAScore,
            scoreTeamTwo: match.teamBScore,
          ),
          if (showDividers) const Divider(),
          const TimeLine(),
          if (showDividers) const Divider(),
          child,
        ],
      ),
    );
  }
}
