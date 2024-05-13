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

  @action
  Future<void> fetchMatches() async {
    try {
      final matchesList = await _matchesService.fetchMatches();
      matches = ObservableList<Match>.of(matchesList);
    } catch (e) {
      print(e.toString());
    }
  }
}
