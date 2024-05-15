import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches_store.dart';
import 'package:imperio/views/widgets/football_pitch/football_pitch.dart';
import 'package:imperio/views/widgets/game_info/game_info.dart';
import 'package:imperio/views/widgets/last_bets/last_bets.dart';
import 'package:imperio/views/widgets/last_matches_conflicts/last_matches_conflicts.dart';
import 'package:imperio/views/widgets/odd_draggable_sheet/odd_draggable_sheet.dart';
import 'package:imperio/views/widgets/referee_facts/referee_facts.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/views/widgets/shared/match_card/betting_houses_display.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/views/widgets/tab_selector/tab_selector.dart';
import 'package:imperio/views/widgets/team_facts/team_facts.dart';

class MatchDetails extends StatelessWidget {
  MatchDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final MatchesStore matchesStore = GetIt.I<MatchesStore>();
    return Observer(builder: (_) {
      if (matchesStore.isLoading) {
        return const Scaffold(
          appBar: CustomAppBar(title: 'Loading...'),
          body: Center(child: CircularProgressIndicator()),
        );
      }

      if (matchesStore.errorMessage != null) {
        return Scaffold(
          appBar: const CustomAppBar(title: 'Error'),
          body: Center(child: Text(matchesStore.errorMessage!)),
        );
      }

      final Match? match = matchesStore.currentMatch;
      if (match == null) {
        return Scaffold(
          appBar: CustomAppBar(
            title: 'Partida não encontrada',
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          ),
          body: const Center(child: Text('Partida não encontrada')),
        );
      }

      return _buildMatchDetails(match, context, matchesStore);
    });
  }

  Widget _buildMatchDetails(
      Match match, BuildContext context, MatchesStore matchesStore) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Partida',
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const Divider(),
                MatchCard(match: match),
                FootballPitch(
                  teamAImg: match.teamAImage,
                  teamBImg: match.teamBImage,
                ),
                GameInfo(match: match),
                TeamFacts(
                  teamAImg: match.teamAImage,
                  teamBImg: match.teamBImage,
                  teamAName: match.teamA,
                  teamBName: match.teamB,
                  teamAFacts: matchesStore.teamAFacts,
                  teamBFacts: matchesStore.teamBFacts,
                ),
                RefereeFacts(
                  refereeName: match.referee,
                  refereeImg: match.refereeAvatar,
                  refereeFacts: matchesStore.refereeFacts,
                ),
                LastBets(betlist: matchesStore.matchBets[match.id]!),
                LastMatchesConflicts(
                  teamAName: match.teamA,
                  teamBName: match.teamB,
                  matchConflicts: matchesStore.matchConflicts[match.id]!,
                  teamAImg: match.teamAImage,
                  teamBImg: match.teamBImage,
                ),
              ],
            ),
          ),
          OddDraggableSheet(),
        ],
      ),
    );
  }
}
