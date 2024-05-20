import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/custom_container/custom_container.dart';
import 'package:imperio/views/widgets/shared/action_prompt_row.dart';
import 'package:imperio/views/widgets/shared/rounded_image.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';
import 'package:imperio/views/widgets/team_facts/ordered_list.dart';

class RefereeFacts extends StatelessWidget {
  final String refereeName;
  final String refereeImg;
  final List<String> refereeFacts;

  const RefereeFacts({
    super.key,
    required this.refereeImg,
    required this.refereeFacts,
    required this.refereeName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(title: 'Fatos do árbitro'),
        CustomContainer(
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Column(
            children: [
              _buildRefereeProfile(context),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 15),
                height: 179,
                child: OrderedList(items: refereeFacts),
              ),
              const ActionPromptRow(
                title: 'Ver mais',
                mainAxisAlignment: MainAxisAlignment.end,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRefereeProfile(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 72,
          width: 72,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              border:
                  Border.all(color: Theme.of(context).dividerColor, width: 1),
              borderRadius: BorderRadius.circular(100)),
          child: CustomNetworkImage(
            imgUrl: refereeImg,
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            refereeName,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        )
      ],
    );
  }
}
