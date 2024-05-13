import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';

class MatchList extends StatelessWidget {
  final MatchesStore matchesStore = GetIt.I<MatchesStore>();

  MatchList({super.key});

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
              child: MatchCard(match: match),
            );
          },
        ),
      );
    });
  }
}
