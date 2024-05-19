import 'package:imperio/models/odd_match.dart';
import 'package:imperio/services/odds_matches_service.dart';
import 'package:mobx/mobx.dart';

part 'odds_matches_store.g.dart';

class OddsMatchesStore = _OddsMatchesStore with _$OddsMatchesStore;

abstract class _OddsMatchesStore with Store {
  final OddsMatchesService _oddsMatchesService;

  _OddsMatchesStore(this._oddsMatchesService);

  @observable
  ObservableList<OddMatch> oddsMatches = ObservableList<OddMatch>();

  @action
  Future<void> fetchOddsMatches(String matchId) async {
    try {
      final oddsMatchesList =
          await _oddsMatchesService.fetchOddsMatches(matchId);
      oddsMatches = ObservableList<OddMatch>.of(oddsMatchesList);
    } catch (e) {
      print(e.toString());
    }
  }
}
