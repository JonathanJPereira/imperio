import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/stores/tab_selector_store.dart';
import 'package:imperio/views/widgets/shared/dot_indicator.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/views/widgets/shared/match_card/view_more.dart';
import 'package:imperio/views/widgets/tab_selector/tab_selector.dart';

class MatchList extends StatelessWidget {
  final TabSelectorStore tabSelectorStore = GetIt.I<TabSelectorStore>();
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();
  final List<String> dateTabs = _generateDateTabs();

  MatchList({super.key});

  void _navigateToMatchDetails(BuildContext context, String matchId) {
    final MatchesStore matchesStore = GetIt.I<MatchesStore>();
    matchesStore.setCurrentMatchId(matchId);

    Navigator.pushNamed(context, '/match_details');
  }

  static List<String> _generateDateTabs() {
    final DateFormat dateFormat = DateFormat('dd/MM');
    final DateTime now = DateTime.now();
    final List<String> dateTabs = ['Live', 'Hoje'];

    for (int i = 1; i <= 5; i++) {
      final DateTime date = now.add(Duration(days: i));
      dateTabs.add(dateFormat.format(date));
    }

    return dateTabs;
  }

  Widget _buildMatchCard(BuildContext context, int index) {
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: TabSelector(
            store: tabSelectorStore,
            tabs: dateTabs,
            borderColor: Theme.of(context).dividerColor,
            firstPrefix: const DotIndicator(size: 9),
          ),
        ),
        Observer(builder: (context) {
          if (matchesStore.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (matchesStore.errorMessage != null) {
            return Center(child: Text(matchesStore.errorMessage!));
          }

          return Wrap(
            children: List<Widget>.generate(
              2,
              (index) => _buildMatchCard(context, index),
            ),
          );
        }),
      ],
    );
  }
}
