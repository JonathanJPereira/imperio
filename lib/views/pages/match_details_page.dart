import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:imperio/stores/matches/matches_store.dart';
import 'package:imperio/views/widgets/football_pitch/football_pitch.dart';
import 'package:imperio/views/widgets/game_info/game_info.dart';
import 'package:imperio/views/widgets/last_bets/last_bets.dart';
import 'package:imperio/views/widgets/last_matches_conflicts/last_matches_conflicts.dart';
import 'package:imperio/views/widgets/odd_draggable_sheet/odd_draggable_sheet.dart';
import 'package:imperio/views/widgets/referee_facts/referee_facts.dart';
import 'package:imperio/views/widgets/shared/custom_app_bar.dart';
import 'package:imperio/models/match/match.dart';
import 'package:imperio/views/widgets/shared/match_card/match_card.dart';
import 'package:imperio/views/widgets/shared/match_card/match_social_stats.dart';
import 'package:imperio/views/widgets/team_facts/team_facts.dart';

class MatchDetailsPage extends StatelessWidget {
  const MatchDetailsPage({super.key});

  static const double verticalSpacing = 20.0;

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
                MatchCard(
                  match: match,
                  child: MatchSocialStats(
                    likeCount: match.likesCount,
                    starCount: match.starsCount,
                    shareCount: match.sharesCount,
                    viewCount: match.viewsCount,
                  ),
                ),
                FootballPitch(
                  teamAImg: match.teamAImage,
                  teamBImg: match.teamBImage,
                ),
                const SizedBox(height: verticalSpacing),
                GameInfo(match: match),
                const SizedBox(height: verticalSpacing),
                TeamFacts(
                  teamAImg: match.teamAImage,
                  teamBImg: match.teamBImage,
                  teamAName: match.teamA,
                  teamBName: match.teamB,
                  teamAFacts: matchesStore.teamAFacts,
                  teamBFacts: matchesStore.teamBFacts,
                ),
                const SizedBox(height: verticalSpacing),
                RefereeFacts(
                  refereeName: match.referee,
                  refereeImg: match.refereeAvatar,
                  refereeFacts: matchesStore.refereeFacts,
                ),
                const SizedBox(height: verticalSpacing),
                LastBets(betlist: matchesStore.matchBets),
                const SizedBox(height: verticalSpacing),
                LastMatchesConflicts(
                  teamAName: match.teamA,
                  teamBName: match.teamB,
                  matchConflicts: matchesStore.matchConflicts,
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
