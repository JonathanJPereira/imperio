import 'package:flutter/material.dart';
import 'package:imperio/utils/imperio_icons.dart';
import 'package:imperio/views/widgets/game_info/game_info.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:imperio/views/widgets/shared/share_button.dart';

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
            MatchCard(match: match),
            buildMatchImageStack(match, context),
            const SizedBox(height: 20),
            GameInfo(
              match: match,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMatchImageStack(Match match, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 200.0,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).scaffoldBackgroundColor
              ],
            ),
          ),
        ),
        Image.asset(
          'assets/images/football_pitch.png',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        positionTeamImage(match.teamAImage, const Alignment(-0.78, -0.5)),
        positionTeamImage(match.teamBImage, const Alignment(0.78, -0.5)),
      ],
    );
  }

  Widget positionTeamImage(String imageUrl, Alignment alignment) {
    return Positioned.fill(
      child: Align(
        alignment: alignment,
        child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1.25),
              color: const Color(0xFFDEE0DF),
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
