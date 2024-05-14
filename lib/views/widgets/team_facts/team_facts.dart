import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/action_prompt_row.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:imperio/views/widgets/team_facts/ordered_list.dart';

class TeamFacts extends StatelessWidget {
  final String teamAImg;
  final String teamAName;
  final String teamBImg;
  final String teamBName;
  final List<String> teamFacts = [
    'Perdeu 6 jogos seguidos',
    'Sequência de derrotas de 4 jogos em casa',
    'Marcou apenas 1 gol nos últimos 4 jogos',
    'Quando perdem por 1-0 fora, eles vencem 40% dos seus jogos',
    'Vencem o primeiro tempo em 16% de suas partidas',
    'Marcam 75% dos seus gols no segundo tempo',
  ];

  TeamFacts({
    super.key,
    required this.teamAImg,
    required this.teamAName,
    required this.teamBImg,
    required this.teamBName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Fatos do time'),
        HorizontalList(
            itemCount: 2,
            height: 406,
            itemBuilder: (context, index) {
              String imgUrl = index == 0 ? teamAImg : teamBImg;
              String teamName = index == 0 ? teamAName : teamBName;

              return SizedBox(
                width: 278,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomNetworkImage(
                              imgUrl: imgUrl,
                              width: 28,
                              height: 28,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              teamName,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 278,
                          child: OrderedList(items: teamFacts),
                        ),
                        const ActionPromptRow(
                          title: 'Ver mais',
                          mainAxisAlignment: MainAxisAlignment.end,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }
}
