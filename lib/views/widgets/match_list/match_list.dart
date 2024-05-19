import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/views/widgets/shared/match_card/view_more.dart';

class MatchList extends StatelessWidget {
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();

  MatchList({super.key});

  void _navigateToMatchDetails(BuildContext context, String matchId) {
    final MatchesStore matchesStore = GetIt.I<MatchesStore>();
    matchesStore.setCurrentMatchId(matchId);

    Navigator.pushNamed(
      context,
      '/match_details',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Wrap(
        children: List<Widget>.generate(
          2,
          (index) {
            var match = matchesStore.matches[index];
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: MatchCard(
                showDividers: false,
                match: match,
                child: Column(
                  children: [
                    BettingHousesDisplay(
                      onexbetOdd: match.onexbetOddsAvg,
                      betsafeOdd: match.betsafeOddsAvg,
                      betssonOdd: match.betssonOddsAvg,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Divider(),
                    ViewMore(
                      onPress: () => _navigateToMatchDetails(context, match.id),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
