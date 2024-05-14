import 'package:flutter/material.dart';
import 'package:imperio/models/bet.dart';
import 'package:imperio/views/widgets/last_bets_won/bet_cart.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';

class LastBets extends StatelessWidget {
  final List<Bet> betlist;

  const LastBets({super.key, required this.betlist});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(
          title: 'Últimas apostas',
        ),
        HorizontalList(
          itemCount: betlist.length,
          height: 88,
          itemBuilder: (context, index) {
            final bet = betlist[index];
            return BetCard(
                userAvatar: bet.avatar,
                user: bet.name,
                platform: bet.stat,
                score: bet.betScore,
                date: bet.date);
          },
        ),
      ],
    );
  }
}
