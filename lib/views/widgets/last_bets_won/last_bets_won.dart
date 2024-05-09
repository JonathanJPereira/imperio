import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/won_bets_store.dart';
import 'package:imperio/views/widgets/last_bets_won/bet_cart.dart';
import 'package:imperio/views/widgets/shared/horizontal_list.dart';
import 'package:imperio/views/widgets/shared/section_header.dart';

class LastBetsWon extends StatelessWidget {
  LastBetsWon({super.key});

  final WonBetsStore wonBetsStore = GetIt.I<WonBetsStore>();

  @override
  Widget build(BuildContext context) {
    wonBetsStore.fetchWonBets();
    return Column(
      children: [
        const SectionHeader(
          title: 'Últimas apostas ganhas',
          svg: 'assets/images/fire.svg',
        ),
        Observer(builder: (_) {
          if (wonBetsStore.wonBets.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return HorizontalList(
            itemCount: wonBetsStore.wonBets.length,
            height: 88,
            itemBuilder: (context, index) {
              final wonBet = wonBetsStore.wonBets[index];
              return BetCard(
                userAvatar: wonBet.userAvatar,
                user: wonBet.user,
                platform: wonBet.platform,
                score: wonBet.score,
              );
            },
          );
        }),
      ],
    );
  }
}
