import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';

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
      body: Column(
        children: [
          const Divider(),
          MatchCard(match: match),
          buildMatchImageStack(match),
        ],
      ),
    );
  }

  Widget buildMatchImageStack(Match match) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          'assets/images/football_pitch.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        positionTeamImage(match.teamAImage, const Alignment(-0.78, -0.9)),
        positionTeamImage(match.teamBImage, const Alignment(0.78, -0.9)),
      ],
    );
  }

  Widget positionTeamImage(String imageUrl, Alignment alignment) {
    return Positioned.fill(
      child: Align(
        alignment: alignment,
        child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.25),
              color: Color(0xFFDEE0DF),
              borderRadius: BorderRadius.circular(62.5),
            ),
            child: CustomNetworkImage(
              imgUrl: imageUrl,
              width: 31.25,
              height: 31.25,
            )),
      ),
    );
  }
}
