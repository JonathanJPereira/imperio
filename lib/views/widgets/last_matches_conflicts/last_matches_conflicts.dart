import 'package:flutter/material.dart';
import 'package:imperio/models/match_conflict/match_conflict.dart';
import 'package:imperio/views/widgets/last_matches_conflicts/match_conflict_card.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:imperio/views/widgets/shared/vertical_divisor.dart';
import 'package:intl/intl.dart';

class LastMatchesConflicts extends StatelessWidget {
  final String teamAName;
  final String teamAImg;
  final String teamBName;
  final String teamBImg;
  final List<MatchConflict> matchConflicts;

  const LastMatchesConflicts({
    super.key,
    required this.matchConflicts,
    required this.teamAName,
    required this.teamBName,
    required this.teamAImg,
    required this.teamBImg,
  });

  @override
  Widget build(BuildContext context) {
    if (matchConflicts.isEmpty) {
      return const Center(
        child: Text('Nenhum conflito encontrado.'),
      );
    }
    final MatchConflict principalConflict = matchConflicts[0];

    return Container(
      padding: const EdgeInsets.all(15),
      color: const Color(0xFF646E69),
      child: Column(
        children: [
          const SectionHeader(
            title: 'Últimos confrontos',
            textPosition: TextPosition.middle,
            color: Colors.white,
          ),
          MatchSummaryCard(
            teamAName: teamAName,
            teamAImg: teamAImg,
            teamBName: teamBName,
            teamBImg: teamBImg,
            principalConflict: principalConflict,
          ),
          const SizedBox(
            height: 10,
          ),
          HorizontalList(
            horizontalPadding: 8,
            itemCount: matchConflicts.length,
            height: 120,
            itemBuilder: (context, index) {
              final conflict = matchConflicts[index];
              return MatchConflictCard(
                conflict: conflict,
                teamAImg: teamAImg,
                teamBImg: teamBImg,
              );
            },
          ),
          const SizedBox(
            height: 200,
          )
        ],
      ),
    );
  }
}

class MatchSummaryCard extends StatelessWidget {
  const MatchSummaryCard({
    super.key,
    required this.teamAName,
    required this.teamAImg,
    required this.teamBName,
    required this.teamBImg,
    required this.principalConflict,
  });

  final String teamAName;
  final String teamAImg;
  final String teamBName;
  final String teamBImg;
  final MatchConflict principalConflict;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Card(
        color: const Color(0xFF747D78),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeamStats(
                  teamName: teamAName,
                  teamImg: teamAImg,
                  winCount: principalConflict.teamAWon),
              DrawStats(drawCount: principalConflict.draw),
              TeamStats(
                  teamName: teamBName,
                  teamImg: teamBImg,
                  winCount: principalConflict.teamBWon),
            ],
          ),
        ),
      ),
    );
  }
}

class TeamStats extends StatelessWidget {
  const TeamStats({
    super.key,
    required this.teamName,
    required this.teamImg,
    required this.winCount,
  });

  final String teamName;
  final String teamImg;
  final int winCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomWhiteLabelText(
          text: teamName,
          size: 14,
        ),
        CustomNetworkImage(
          imgUrl: teamImg,
          width: 37.5,
          height: 37.5,
        ),
        const VerticalDivisor(
          height: 13,
        ),
        Column(
          children: [
            Text(NumberFormat.compact().format(winCount),
                style: const TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.w500)),
            const CustomWhiteLabelText(text: 'Vitórias')
          ],
        ),
      ],
    );
  }
}

class DrawStats extends StatelessWidget {
  const DrawStats({
    super.key,
    required this.drawCount,
  });

  final int drawCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          drawCount.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        const CustomWhiteLabelText(text: 'Empates')
      ],
    );
  }
}

class CustomWhiteLabelText extends StatelessWidget {
  final String text;
  final double size;

  const CustomWhiteLabelText({
    required this.text,
    super.key,
    this.size = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: size,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
