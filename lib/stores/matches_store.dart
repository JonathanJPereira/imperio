import 'package:imperio/models/bet.dart';
import 'package:imperio/models/match.dart';
import 'package:imperio/models/match_conflict.dart';
import 'package:imperio/services/matches_service.dart';
import 'package:mobx/mobx.dart';

part 'matches_store.g.dart';

class MatchesStore = _MatchesStore with _$MatchesStore;

abstract class _MatchesStore with Store {
  final MatchesService _matchesService;

  _MatchesStore(this._matchesService) {
    fetchMatches().then((value) => print(matches));
  }

  @observable
  ObservableList<Match> matches = ObservableList<Match>();

  @observable
  String _currentMatchId = "";

  @observable
  ObservableMap<String, List<Bet>> matchBets =
      ObservableMap<String, List<Bet>>();

  @observable
  ObservableMap<String, List<MatchConflict>> matchConflicts =
      ObservableMap<String, List<MatchConflict>>();

  @computed
  List<String> get teamAFacts {
    return currentMatch?.teamAStats.split('. ') ?? [];
  }

  @computed
  List<String> get teamBFacts {
    return currentMatch?.teamBStats.split('. ') ?? [];
  }

  @computed
  List<String> get refereeFacts {
    return currentMatch?.refereeStats.split('. ') ?? [];
  }

  @computed
  Match? get currentMatch {
    try {
      Match match = matches.firstWhere((match) => match.id == _currentMatchId);
      return match;
    } catch (e) {
      return null;
    }
  }

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchMatches() async {
    isLoading = true;
    errorMessage = null;
    try {
      final matchesList = await _matchesService.fetchMatches();
      matches = ObservableList<Match>.of(matchesList);
    } catch (e) {
      errorMessage = "Failed to load matches: ${e.toString()}";
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> enrichMatch(String matchId) async {
    isLoading = true;
    errorMessage = null;
    try {
      List<dynamic> results = await Future.wait([
        _matchesService.fetchBets(matchId),
        _matchesService.fetchMatchConflicts(matchId)
      ]);

      List<Bet> bets = results[0];
      List<MatchConflict> conflicts = results[1];

      matchBets[matchId] = bets;
      matchConflicts[matchId] = conflicts;
    } catch (e) {
      errorMessage = "Failed to enrich match: ${e.toString()}";
    } finally {
      isLoading = false;
    }
  }

  @action
  void setCurrentMatchId(String id) {
    _currentMatchId = id;
    enrichMatch(_currentMatchId);
  }
}
