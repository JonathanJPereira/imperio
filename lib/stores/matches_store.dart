import 'package:imperio/models/match.dart';
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
  String currentMatchId = "";

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
      Match match = matches.firstWhere((match) => match.id == currentMatchId);
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
  void setCurrentMatchId(String id) {
    currentMatchId = id;
  }
}
