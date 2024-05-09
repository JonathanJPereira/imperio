import 'package:flutter/material.dart';
import 'package:imperio/views/widgets/shared/match_card.dart';

class MatchList extends StatelessWidget {
  const MatchList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MatchCard(),
      ],
    );
  }
}
