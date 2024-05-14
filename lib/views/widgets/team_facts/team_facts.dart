import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/custom_container/custom_container.dart';
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
  final List<String> teamFacts;

  const TeamFacts({
    super.key,
    required this.teamAImg,
    required this.teamAName,
    required this.teamBImg,
    required this.teamBName,
    required this.teamFacts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Fatos do time'),
        HorizontalList(
          itemDistance: 25,
          itemCount: 2,
          height: 426,
          itemBuilder: (context, index) {
            String imgUrl = index == 0 ? teamAImg : teamBImg;
            String teamName = index == 0 ? teamAName : teamBName;

            return SizedBox(
              width: 278,
              child: CustomContainer(
                margin: EdgeInsets.zero,
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
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 288,
                      child: OrderedList(items: teamFacts),
                    ),
                    const ActionPromptRow(
                      title: 'Ver mais',
                      mainAxisAlignment: MainAxisAlignment.end,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
