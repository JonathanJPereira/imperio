import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/game_info/game_info.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/views/widgets/team_facts/team_facts.dart';

class MatchDetails extends StatelessWidget {
  const MatchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final match = ModalRoute.of(context)!.settings.arguments as Match;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Partida',
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            // MatchCard(match: match),
            // FootballPitch(match: match),
            // const SizedBox(height: 20),
            // GameInfo(match: match),
            TeamFacts(
              teamAImg: match.teamAImage,
              teamBImg: match.teamBImage,
              teamAName: match.teamA,
              teamBName: match.teamB,
              teamFacts: match.teamBStats.split('. '),
            )
          ],
        ),
      ),
    );
  }
}
