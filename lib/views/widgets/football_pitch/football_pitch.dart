import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/models/match.dart';

class FootballPitch extends StatelessWidget {
  final Match match;

  const FootballPitch({
    super.key,
    required this.match,
  });

  @override
  Widget build(BuildContext context) {
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
